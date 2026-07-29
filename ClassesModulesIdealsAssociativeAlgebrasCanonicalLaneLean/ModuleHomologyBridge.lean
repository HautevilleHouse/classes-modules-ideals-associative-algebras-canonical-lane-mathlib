import canonicalLaneMathlib.AdmissibleClass

/-!
# Module Homology Bridge

This module defines the bridge and gate closure for the category of modules
over an associative algebra, relating exact sequences to admissible closure.
-/

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

open HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure ShortExactSequence {A : AssocAlgebra} (M N P : ModuleOverAssocAlgebra A) where
  f : ModuleMorphism M N
  g : ModuleMorphism N P
  exactness : ∀ x : N.moduleCarrier, (g.map x = (0 : P.moduleCarrier)) ↔ ∃ (y : M.moduleCarrier), f.map y = x
  f_injective : ∀ x y : M.moduleCarrier, f.map x = f.map y → x = y
  g_surjective : ∀ z : P.moduleCarrier, ∃ x : N.moduleCarrier, g.map x = z

def bridgeClosed (A : AdmissibleClass) : Prop := 
  ∃ (alg : AssocAlgebra) (M N P : ModuleOverAssocAlgebra alg), Nonempty (ShortExactSequence M N P)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse