import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.ModuleStructure

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure IdealStructure {R : AssociativeAlgebraStructure} (M : ModuleStructure R) where
  carrier : Set M.carrier
  zeroMem : M.zero ∈ carrier
  addClosed : ∀ a b : M.carrier, a ∈ carrier → b ∈ carrier → M.addition a b ∈ carrier
  smulClosed : ∀ (r : R.carrier) (a : M.carrier), a ∈ carrier → M.smul r a ∈ carrier

structure IdealEvidence {R : AssociativeAlgebraStructure} {M : ModuleStructure R} (I : IdealStructure M) where
  zeroMemClosed : I.zeroMem
  addClosedClosed : I.addClosed
  smulClosedClosed : I.smulClosed

def IdealClosed {R : AssociativeAlgebraStructure} {M : ModuleStructure R} (I : IdealStructure M) : Prop :=
  I.zeroMem ∧ I.addClosed ∧ I.smulClosed

theorem ideal_closed_from_evidence {R : AssociativeAlgebraStructure} {M : ModuleStructure R} (I : IdealStructure M) (E : IdealEvidence I) :
    IdealClosed I := by
  exact And.intro E.zeroMemClosed (And.intro E.addClosedClosed E.smulClosedClosed)

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse