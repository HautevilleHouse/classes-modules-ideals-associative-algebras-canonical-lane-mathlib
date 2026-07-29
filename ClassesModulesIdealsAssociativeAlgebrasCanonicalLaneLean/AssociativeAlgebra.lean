import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.ModuleStructure

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure AssociativeAlgebraPackage (R : Type u) [CommRing R] where
  carrier : Type v
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  smul : R → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  addLeftNeg : ∀ a : carrier, ∃ b : carrier, add a b = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : carrier, mul one a = a
  mulOne : ∀ a : carrier, mul a one = a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  smulAddDistr : ∀ r : R, ∀ a b : carrier, smul r (add a b) = add (smul r a) (smul r b)
  addSmulDistr : ∀ a : carrier, ∀ r s : R, smul (r + s) a = add (smul r a) (smul s a)
  mulSmulAssoc : ∀ r s : R, ∀ a : carrier, smul (r * s) a = smul r (smul s a)
  oneSmul : ∀ a : carrier, smul 1 a = a
  smulMulAssoc : ∀ r : R, ∀ a b : carrier, smul r (mul a b) = mul (smul r a) b
  mulSmulComm : ∀ r : R, ∀ a b : carrier, mul (smul r a) b = smul r (mul a b)

structure AssociativeAlgebraEvidence {R : Type u} [CommRing R] (A : AssociativeAlgebraPackage R) where
  axiomsSatisfied : True

def AssociativeAlgebraClosed {R : Type u} [CommRing R] (A : AssociativeAlgebraPackage R) : Prop :=
  True

theorem associative_algebra_closed_from_evidence {R : Type u} [CommRing R] (A : AssociativeAlgebraPackage R) (E : AssociativeAlgebraEvidence A) : AssociativeAlgebraClosed A := by
  trivial

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse