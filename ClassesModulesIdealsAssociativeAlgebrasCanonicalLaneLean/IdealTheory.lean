import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.ModuleStructure

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure IdealPackage {R : Type u} [CommRing R] where
  carrier : Set R
  zeroMem : (0 : R) ∈ carrier
  addClosed : ∀ x y ∈ carrier, x + y ∈ carrier
  smulClosed : ∀ r : R, ∀ x ∈ carrier, r * x ∈ carrier

structure IdealEvidence {R : Type u} [CommRing R] (I : IdealPackage R) where
  zeroMemClosed : I.zeroMem
  addClosedClosed : I.addClosed
  smulClosedClosed : I.smulClosed

def IdealClosed {R : Type u} [CommRing R] (I : IdealPackage R) : Prop :=
  I.zeroMem ∧ I.addClosed ∧ I.smulClosed

theorem ideal_closed_from_evidence {R : Type u} [CommRing R] (I : IdealPackage R) (E : IdealEvidence I) : IdealClosed I := by
  exact And.intro E.zeroMemClosed (And.intro E.addClosedClosed E.smulClosedClosed)

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
