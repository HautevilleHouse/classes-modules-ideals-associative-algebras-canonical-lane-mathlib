import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

def bridgeClosed (A : ModuleAlgebraAdmissibleClass R) : Prop :=
  AssociativeAlgebraClosed A.algebra ∧ ModuleStructureClosed A.moduleStructure ∧ IdealClosed A.ideal

theorem bridge_from_admissible_class (A : ModuleAlgebraAdmissibleClass R) : bridgeClosed A := by
  have h1 : AssociativeAlgebraClosed A.algebra := associative_algebra_closed A.algebra
  have h2 : ModuleStructureClosed A.moduleStructure := module_structure_closed A.moduleStructure
  have h3 : IdealClosed A.ideal := ideal_closed A.ideal
  exact And.intro h1 (And.intro h2 h3)

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse