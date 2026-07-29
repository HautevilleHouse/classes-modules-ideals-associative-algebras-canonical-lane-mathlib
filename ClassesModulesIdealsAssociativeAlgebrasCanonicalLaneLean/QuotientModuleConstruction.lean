import canonicalLaneMathlib.AdmissibleClass

/-!
# Quotient Module Construction

This module constructs quotient modules by submodules and verifies
the universal property.
-/

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

open HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure Submodule {A : AssocAlgebra} (M : ModuleOverAssocAlgebra A) where
  carrier : Set M.moduleCarrier
  zero_mem : (0 : M.moduleCarrier) ∈ carrier
  add_mem : ∀ {x y : M.moduleCarrier}, x ∈ carrier → y ∈ carrier → M.moduleAdd x y ∈ carrier
  smul_mem : ∀ (r : A.carrierType) {x : M.moduleCarrier}, x ∈ carrier → M.smul r x ∈ carrier

structure QuotientModule {A : AssocAlgebra} (M : ModuleOverAssocAlgebra A) (N : Submodule M) where
  carrier : Type w
  proj : M.moduleCarrier → carrier
  proj_add : ∀ x y : M.moduleCarrier, proj (M.moduleAdd x y) = proj x + proj y
  proj_smul : ∀ (r : A.carrierType) (x : M.moduleCarrier), proj (M.smul r x) = r • proj x
  proj_zero : proj (0 : M.moduleCarrier) = 0
  universalProperty : ∀ (X : Type w) (f : M.moduleCarrier → X) (h_add : ∀ x y, f (M.moduleAdd x y) = f x + f y)
    (h_smul : ∀ r x, f (M.smul r x) = r • f x) (h_zero : f (0 : M.moduleCarrier) = 0),
    ∃! (g : carrier → X), ∀ x, g (proj x) = f x

def QuotientModuleClosed {A : AssocAlgebra} (M : ModuleOverAssocAlgebra A) (N : Submodule M) : Prop :=
  Nonempty (QuotientModule M N)

theorem quotient_module_closed_from_evidence {A : AssocAlgebra} (M : ModuleOverAssocAlgebra A) (N : Submodule M) :
  QuotientModuleClosed M N :=
  Nonempty.intro ({
    carrier := M.moduleCarrier / (λ x y => M.moduleAdd x y ∈ N.carrier)
    proj := λ x => Quotient.mk x
    proj_add := λ x y => by
      apply Quotient.sound; exact N.add_mem (by trivial) (by trivial)
    proj_smul := λ r x => by
      apply Quotient.sound; exact N.smul_mem r (by trivial)
    proj_zero := rfl
    universalProperty := λ X f h_add h_smul h_zero => by
      refine ⟨λ q => Quotient.lift f ?_ q, λ x => rfl, λ g h => ?_⟩
      · intro a b h; exact h_add a b
      · ext q; apply Quotient.inductionOn q; exact h
  } : QuotientModule M N)

end HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse