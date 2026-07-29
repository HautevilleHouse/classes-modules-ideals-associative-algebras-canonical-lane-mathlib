import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.AlgebraicStructures
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.ModuleStructure
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.IdealStructure

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

def ConstrainedAlgebraClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_algebra_endgame (A : AdmissibleClass) :
    ConstrainedAlgebraClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse