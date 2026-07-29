import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure TensorProduct (R : Type u) [CommRing R] (M N : ModuleOverRing R) where
  carrier : Type v
  equilibratedMap : (M.carrier × N.carrier) → carrier
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  smul : R → carrier → carrier
  bilinear : ∀ (r : R) (m m' : M.carrier) (n n' : N.carrier),
    equilibratedMap (M.add m m', n) = add (equilibratedMap (m, n)) (equilibratedMap (m', n)) ∧
    equilibratedMap (m, N.add n n') = add (equilibratedMap (m, n)) (equilibratedMap (m, n')) ∧
    equilibratedMap (M.smul r m, n) = smul r (equilibratedMap (m, n)) ∧
    equilibratedMap (m, N.smul r n) = smul r (equilibratedMap (m, n))
  universalProperty : Prop

structure TensorProductPackage (R : Type u) [CommRing R] (M N : ModuleOverRing R) where
  tensorProduct : TensorProduct R M N
  associativity : Prop
  commutativity : Prop
  unitality : Prop

structure TensorProductEvidence {R : Type u} [CommRing R] {M N : ModuleOverRing R}
    (T : TensorProductPackage R M N) where
  associativityClosed : T.associativity
  commutativityClosed : T.commutativity
  unitalityClosed : T.unitality

def TensorProductClosed {R : Type u} [CommRing R] {M N : ModuleOverRing R}
    (T : TensorProductPackage R M N) : Prop :=
  T.associativity ∧ T.commutativity ∧ T.unitality

theorem tensor_product_closed_from_evidence {R : Type u} [CommRing R] {M N : ModuleOverRing R}
    (T : TensorProductPackage R M N) (E : TensorProductEvidence T) :
    TensorProductClosed T := by
  exact And.intro E.associativityClosed
    (And.intro E.commutativityClosed E.unitalityClosed)

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
