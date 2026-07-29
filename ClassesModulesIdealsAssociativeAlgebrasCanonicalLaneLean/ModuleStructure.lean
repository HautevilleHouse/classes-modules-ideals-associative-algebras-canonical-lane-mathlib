import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.AlgebraicStructures

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure ModuleStructure (R : AssociativeAlgebraStructure) where
  carrier : Type u
  addition : carrier → carrier → carrier
  zero : carrier
  smul : R.carrier → carrier → carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  addComm : ∀ a b c : carrier, addition a b = addition b a
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  smulAddDistrib : ∀ r s : R.carrier, ∀ a b : carrier, smul (R.addition r s) a = addition (smul r a) (smul s a)
  addSmulDistrib : ∀ r : R.carrier, ∀ a b : carrier, smul r (addition a b) = addition (smul r a) (smul r b)
  smulAssoc : ∀ r s : R.carrier, ∀ a : carrier, smul (R.multiplication r s) a = smul r (smul s a)
  oneSmul : ∀ a : carrier, smul R.one a = a

structure ModuleEvidence {R : AssociativeAlgebraStructure} (M : ModuleStructure R) where
  addAssocClosed : M.addAssoc
  addCommClosed : M.addComm
  zeroAddClosed : M.zeroAdd
  addZeroClosed : M.addZero
  smulAddDistribClosed : M.smulAddDistrib
  addSmulDistribClosed : M.addSmulDistrib
  smulAssocClosed : M.smulAssoc
  oneSmulClosed : M.oneSmul

def ModuleClosed {R : AssociativeAlgebraStructure} (M : ModuleStructure R) : Prop :=
  M.addAssoc ∧ M.addComm ∧ M.zeroAdd ∧ M.addZero ∧ M.smulAddDistrib ∧ M.addSmulDistrib ∧ M.smulAssoc ∧ M.oneSmul

theorem module_closed_from_evidence {R : AssociativeAlgebraStructure} (M : ModuleStructure R) (E : ModuleEvidence M) :
    ModuleClosed M := by
  exact And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.zeroAddClosed (And.intro E.addZeroClosed
    (And.intro E.smulAddDistribClosed (And.intro E.addSmulDistribClosed (And.intro E.smulAssocClosed E.oneSmulClosed))))))

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse