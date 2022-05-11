#!/bin/bash

cd contracts/circuits

mkdir Multiplier3_plonk

echo "Compiling Multiplier3.circom..."

circom Multiplier3.circom --r1cs --wasm --sym -o Multiplier3_plonk
snarkjs r1cs info Multiplier3_plonk/Multiplier3.r1cs

snarkjs plonk setup Multiplier3_plonk/Multiplier3.r1cs powersOfTau28_hez_final_10.ptau Multiplier3_plonk/circuit_final.zkey
snarkjs zkey export verificationkey Multiplier3_plonk/circuit_final.zkey Multiplier3_plonk/verification_key.json

snarkjs zkey export solidityverifier Multiplier3_plonk/circuit_final.zkey ../Multiplier3Verifier_plonk.sol