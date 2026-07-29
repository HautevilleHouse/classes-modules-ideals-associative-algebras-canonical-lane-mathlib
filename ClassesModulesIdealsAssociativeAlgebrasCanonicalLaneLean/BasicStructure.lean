import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure PrimitiveRing where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  addComm : ∀ a b : carrier, addition a b = addition b a
  mulAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  mulOne : ∀ a : carrier, multiplication a one = a
  oneMul : ∀ a : carrier, multiplication one a = a
  distribLeft : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  distribRight : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)

structure LeftModule (R : PrimitiveRing) where
  carrier : Type u
  zero : carrier
  addition : carrier → carrier → carrier
  smul : R.carrier → carrier → carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  addComm : ∀ a b : carrier, addition a b = addition b a
  smulAdd : ∀ r : R.carrier, ∀ a b : carrier, smul r (addition a b) = addition (smul r a) (smul r b)
  addSmul : ∀ r s : R.carrier, ∀ a : carrier, smul (R.addition r s) a = addition (smul r a) (smul s a)
  mulSmul : ∀ r s : R.carrier, ∀ a : carrier, smul (R.multiplication r s) a = smul r (smul s a)
  oneSmul : ∀ a : carrier, smul R.one a = a

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse