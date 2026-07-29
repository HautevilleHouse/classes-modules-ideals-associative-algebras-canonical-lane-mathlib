import canonicalLaneMathlib.AdmissibleClass

/-!
# Two-Sided Ideal Gate

This module defines two-sided ideals within an associative algebra and provides
the gate condition for admissible closure.
-/

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

open HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure TwoSidedIdeal (A : AssocAlgebra) where
  carrier : Set A.carrierType
  zero_mem : (0 : A.carrierType) ∈ carrier
  add_mem  : ∀ {x y : A.carrierType}, x ∈ carrier → y ∈ carrier → A.addition x y ∈ carrier
  neg_mem  : ∀ {x : A.carrierType}, x ∈ carrier → (-x) ∈ carrier
  smul_mem_left  : ∀ (r : A.carrierType) {x : A.carrierType}, x ∈ carrier → A.multiplication r x ∈ carrier
  smul_mem_right : ∀ (r : A.carrierType) {x : A.carrierType}, x ∈ carrier → A.multiplication x r ∈ carrier

def gateClosed (A : AdmissibleClass) : Prop :=
  ∃ (alg : AssocAlgebra) (I : TwoSidedIdeal alg), Set.Nonempty (I.carrierᶜ)

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse