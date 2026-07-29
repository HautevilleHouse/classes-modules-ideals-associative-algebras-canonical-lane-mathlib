import canonicalLaneMathlib.AdmissibleClass

/-!
# Module Category over Associative Algebra Package

This module defines the category of modules over a fixed associative algebra,
recording the essential structure as an admissible class.
-/

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure AssocAlgebra where
  baseRing : Type u
  carrierType : Type v
  addition : carrierType → carrierType → carrierType
  multiplication : carrierType → carrierType → carrierType
  additionAssoc : ∀ x y z : carrierType, addition (addition x y) z = addition x (addition y z)
  additionComm : ∀ x y : carrierType, addition x y = addition y x
  zeroAdd : ∀ x : carrierType, addition (0 : carrierType) x = x
  addZero : ∀ x : carrierType, addition x (0 : carrierType) = x
  negAdd : ∀ x : carrierType, addition x (-x) = 0
  addNeg : ∀ x : carrierType, addition (-x) x = 0
  mulAssoc : ∀ x y z : carrierType, multiplication (multiplication x y) z = multiplication x (multiplication y z)
  distribLeft : ∀ x y z : carrierType, multiplication x (addition y z) = addition (multiplication x y) (multiplication x z)
  distribRight : ∀ x y z : carrierType, multiplication (addition x y) z = addition (multiplication x z) (multiplication y z)
  oneMul : ∀ x : carrierType, multiplication (1 : carrierType) x = x
  mulOne : ∀ x : carrierType, multiplication x (1 : carrierType) = x

def AssocAlgebra.addition := addition
def AssocAlgebra.multiplication := multiplication

structure ModuleOverAssocAlgebra (A : AssocAlgebra) where
  moduleCarrier : Type w
  moduleAdd : moduleCarrier → moduleCarrier → moduleCarrier
  zeroModule : moduleCarrier
  negModule : moduleCarrier → moduleCarrier
  moduleAddAssoc : ∀ x y z : moduleCarrier, moduleAdd (moduleAdd x y) z = moduleAdd x (moduleAdd y z)
  moduleAddComm : ∀ x y : moduleCarrier, moduleAdd x y = moduleAdd y x
  zeroAddModule : ∀ x : moduleCarrier, moduleAdd (0 : moduleCarrier) x = x
  addZeroModule : ∀ x : moduleCarrier, moduleAdd x (0 : moduleCarrier) = x
  negAddModule : ∀ x : moduleCarrier, moduleAdd x (negModule x) = 0
  addNegModule : ∀ x : moduleCarrier, moduleAdd (negModule x) x = 0
  smul : A.carrierType → moduleCarrier → moduleCarrier
  smulAssoc : ∀ (r s : A.carrierType) (x : moduleCarrier), smul (A.multiplication r s) x = smul r (smul s x)
  smulDistribLeft : ∀ (r : A.carrierType) (x y : moduleCarrier), smul r (moduleAdd x y) = moduleAdd (smul r x) (smul r y)
  smulDistribRight : ∀ (r s : A.carrierType) (x : moduleCarrier), smul (A.addition r s) x = moduleAdd (smul r x) (smul s x)
  oneSmul : ∀ x : moduleCarrier, smul (1 : A.carrierType) x = x

structure ModuleMorphism {A : AssocAlgebra} (M N : ModuleOverAssocAlgebra A) where
  map : M.moduleCarrier → N.moduleCarrier
  addMap : ∀ x y : M.moduleCarrier, map (M.moduleAdd x y) = N.moduleAdd (map x) (map y)
  smulMap : ∀ (r : A.carrierType) (x : M.moduleCarrier), map (M.smul r x) = N.smul r (map x)
  mapZero : map (0 : M.moduleCarrier) = (0 : N.moduleCarrier)

def ModuleCategoryClosed {A : AssocAlgebra} (M N : ModuleOverAssocAlgebra A) : Prop :=
  Nonempty (ModuleMorphism M N)

end HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse