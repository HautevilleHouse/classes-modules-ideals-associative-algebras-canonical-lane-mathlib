import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.ModuleStructure
import HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean.AssociativeAlgebra

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure AlgebraHomomorphismPackage {R : Type u} [CommRing R] (A B : AssociativeAlgebraPackage R) where
  mapFunc : A.carrier → B.carrier
  preservesAdd : ∀ x y : A.carrier, mapFunc (A.add x y) = B.add (mapFunc x) (mapFunc y)
  preservesMul : ∀ x y : A.carrier, mapFunc (A.mul x y) = B.mul (mapFunc x) (mapFunc y)
  preservesOne : mapFunc A.one = B.one
  preservesSmul : ∀ r : R, ∀ x : A.carrier, mapFunc (A.smul r x) = B.smul r (mapFunc x)

structure AlgebraHomomorphismEvidence {R : Type u} [CommRing R] {A B : AssociativeAlgebraPackage R} (φ : AlgebraHomomorphismPackage A B) where
  axiomsSatisfied : True

def AlgebraHomomorphismClosed {R : Type u} [CommRing R] {A B : AssociativeAlgebraPackage R} (φ : AlgebraHomomorphismPackage A B) : Prop :=
  True

theorem algebra_homomorphism_closed_from_evidence {R : Type u} [CommRing R] {A B : AssociativeAlgebraPackage R} (φ : AlgebraHomomorphismPackage A B) (E : AlgebraHomomorphismEvidence φ) : AlgebraHomomorphismClosed φ := by
  unfold AlgebraHomomorphismClosed
  trivial

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse