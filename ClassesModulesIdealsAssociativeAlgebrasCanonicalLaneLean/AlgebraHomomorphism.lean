import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.AssociativeAlgebra

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure AlgebraHomomorphism (R : Type u) [CommRing R] (A : Type v) [AddCommGroup A] [Module R A] (B : Type w) [AddCommGroup B] [Module R B]
    (algA : AssociativeAlgebra R A) (algB : AssociativeAlgebra R B) where
  toFun : A → B
  map_one' : toFun 1 = 1
  map_mul' : ∀ x y : A, toFun (algA.mul x y) = algB.mul (toFun x) (toFun y)
  map_add' : ∀ x y : A, toFun (x + y) = toFun x + toFun y
  map_smul' : ∀ (r : R) (x : A), toFun (r • x) = r • toFun x

def AlgebraHomomorphismClosed {R : Type u} [CommRing R] {A : Type v} [AddCommGroup A] [Module R A] {B : Type w} [AddCommGroup B] [Module R B]
    {algA : AssociativeAlgebra R A} {algB : AssociativeAlgebra R B} (f : AlgebraHomomorphism R A B algA algB) : Prop :=
  f.map_one' ∧ f.map_mul' ∧ f.map_add' ∧ f.map_smul'

theorem algebra_homomorphism_closed {R : Type u} [CommRing R] {A : Type v} [AddCommGroup A] [Module R A] {B : Type w} [AddCommGroup B] [Module R B]
    {algA : AssociativeAlgebra R A} {algB : AssociativeAlgebra R B} (f : AlgebraHomomorphism R A B algA algB) : AlgebraHomomorphismClosed f := by
  exact And.intro f.map_one' (And.intro f.map_mul' (And.intro f.map_add' f.map_smul'))

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse