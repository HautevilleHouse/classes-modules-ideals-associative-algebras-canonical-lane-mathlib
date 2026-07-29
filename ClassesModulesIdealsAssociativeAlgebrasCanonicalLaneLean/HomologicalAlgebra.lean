import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure ChainComplex (R : Type u) [Ring R] where
  objects : ℕ → ModuleOverRing R
  differentials : ∀ n : ℕ, ModuleHom R (objects (n+1)) (objects n)
  chainComplexCondition : ∀ n : ℕ,
    let d := differentials n; d.map = 0 ∘ (differentials (n+1)).map

structure Homology (R : Type u) [Ring R] (C : ChainComplex R) (n : ℕ) where
  kernelImageQuotient : Prop
  homologyGroup : ModuleOverRing R
  exactnessProperty : Prop

structure HomologicalAlgebraPackage (R : Type u) [Ring R] where
  complex : ChainComplex R
  homology : ∀ n : ℕ, Homology R complex n
  spectralSequence : Prop
  derivedFunctor : Prop

structure HomologicalAlgebraEvidence {R : Type u} [Ring R]
    (H : HomologicalAlgebraPackage R) where
  spectralSequenceClosed : H.spectralSequence
  derivedFunctorClosed : H.derivedFunctor

def HomologicalAlgebraClosed {R : Type u} [Ring R] (H : HomologicalAlgebraPackage R) : Prop :=
  H.spectralSequence ∧ H.derivedFunctor

theorem homological_algebra_closed_from_evidence {R : Type u} [Ring R]
    (H : HomologicalAlgebraPackage R) (E : HomologicalAlgebraEvidence H) :
    HomologicalAlgebraClosed H := by
  exact And.intro E.spectralSequenceClosed E.derivedFunctorClosed

end ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
