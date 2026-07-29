import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure AssociativeAlgebraStructure where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  addComm : ∀ a b : carrier, addition a b = addition b a
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  mulAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  oneMul : ∀ a : carrier, multiplication one a = a
  mulOne : ∀ a : carrier, multiplication a one = a
  leftDistrib : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  rightDistrib : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)
  zeroNotOne : zero ≠ one

structure AssociativeAlgebraEvidence (A : AssociativeAlgebraStructure) where
  addAssocClosed : A.addAssoc
  addCommClosed : A.addComm
  zeroAddClosed : A.zeroAdd
  addZeroClosed : A.addZero
  mulAssocClosed : A.mulAssoc
  oneMulClosed : A.oneMul
  mulOneClosed : A.mulOne
  leftDistribClosed : A.leftDistrib
  rightDistribClosed : A.rightDistrib
  zeroNotOneClosed : A.zeroNotOne

def AssociativeAlgebraClosed (A : AssociativeAlgebraStructure) : Prop :=
  A.addAssoc ∧ A.addComm ∧ A.zeroAdd ∧ A.addZero ∧ A.mulAssoc ∧ A.oneMul ∧ A.mulOne ∧ A.leftDistrib ∧ A.rightDistrib ∧ A.zeroNotOne

theorem associative_algebra_closed_from_evidence (A : AssociativeAlgebraStructure) (E : AssociativeAlgebraEvidence A) :
    AssociativeAlgebraClosed A := by
  exact And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.zeroAddClosed (And.intro E.addZeroClosed
    (And.intro E.mulAssocClosed (And.intro E.oneMulClosed (And.intro E.mulOneClosed (And.intro E.leftDistribClosed
      (And.intro E.rightDistribClosed E.zeroNotOneClosed))))))))

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse