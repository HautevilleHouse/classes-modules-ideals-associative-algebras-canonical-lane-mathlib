import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

def gateClosed (A : ModuleAlgebraAdmissibleClass R) : Prop := True

theorem gate_from_admissible_class (A : ModuleAlgebraAdmissibleClass R) : gateClosed A := by
  trivial

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse