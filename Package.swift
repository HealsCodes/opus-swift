// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let archSpecificSources: [String]?
let archSpecificCFlags: [String]?

#if arch(arm) || arch(arm64)
archSpecificSources = [
    // arm specific sources
    "./native/celt/arm/celt_neon_intr.c",
    "./native/celt/arm/pitch_neon_intr.c",
    "./native/silk/arm/biquad_alt_neon_intr.c",
    "./native/silk/arm/LPC_inv_pred_gain_neon_intr.c",
    "./native/silk/arm/NSQ_del_dec_neon_intr.c",
    "./native/silk/arm/NSQ_neon.c",
]

archSpecificCFlags = [
]

#elseif arch(x86_64)
archSpecificSources = [
    /// intel specific sources (untested)
    "./native/celt/celt_lpc_sse4_1.c",
    "./native/celt/pitch_avx.c",
    "./native/celt/pitch_sse.c",
    "./native/celt/pitch_sse2.c",
    "./native/celt/pitch_sse4_1.c",
    "./native/celt/vq_sse2.c",
    "./native/celt/x86_celt_map.c",
    "./native/celt/x86cpu.c",
    "./native/celt/x86cpu.h",
    "./native/silk/NSQ_del_dec_avx2.c",
    "./native/silk/NSQ_del_dec_sse4_1.c",
    "./native/silk/NSQ_sse4_1.c",
    "./native/silk/VAD_sse4_1.c",
    "./native/silk/VQ_WMat_EC_sse4_1.c",
    "./native/silk/x86_silk_map.c",
]

archSpecificCFlags = [
    // FIXME: this is opportunistic but I'd hope that any recent intel CPU would have all of them
    "-msse",
    "-msse2",
    "-msse4.1",
    "-mavx",
    "-mfma",
    "-mavx2"
]
#else
#error("unsupported target architecture")
#endif

let package = Package(
    name: "opus-swift",
    products: [
        .library(
            name: "LibOpus",
            targets: ["LibOpus"]),
    ],
    targets: [
        // Opus native sources
        .target(
            name: "LibOpus",
            dependencies: [],
            path: "Sources/opus-swift",
            exclude: [],
            sources: [
                "./extra/opus_swift.h",
                // common sources
                "./native/celt/bands.c",
                "./native/celt/celt.c",
                "./native/celt/celt_encoder.c",
                "./native/celt/celt_decoder.c",
                "./native/celt/cwrs.c",
                "./native/celt/entcode.c",
                "./native/celt/entdec.c",
                "./native/celt/entenc.c",
                "./native/celt/kiss_fft.c",
                "./native/celt/laplace.c",
                "./native/celt/mathops.c",
                "./native/celt/mdct.c",
                "./native/celt/modes.c",
                "./native/celt/pitch.c",
                "./native/celt/celt_lpc.c",
                "./native/celt/quant_bands.c",
                "./native/celt/rate.c",
                "./native/celt/vq.c",
                "./native/silk/CNG.c",
                "./native/silk/code_signs.c",
                "./native/silk/init_decoder.c",
                "./native/silk/decode_core.c",
                "./native/silk/decode_frame.c",
                "./native/silk/decode_parameters.c",
                "./native/silk/decode_indices.c",
                "./native/silk/decode_pulses.c",
                "./native/silk/decoder_set_fs.c",
                "./native/silk/dec_API.c",
                "./native/silk/enc_API.c",
                "./native/silk/encode_indices.c",
                "./native/silk/encode_pulses.c",
                "./native/silk/gain_quant.c",
                "./native/silk/interpolate.c",
                "./native/silk/LP_variable_cutoff.c",
                "./native/silk/NLSF_decode.c",
                "./native/silk/NSQ.c",
                "./native/silk/NSQ_del_dec.c",
                "./native/silk/PLC.c",
                "./native/silk/shell_coder.c",
                "./native/silk/tables_gain.c",
                "./native/silk/tables_LTP.c",
                "./native/silk/tables_NLSF_CB_NB_MB.c",
                "./native/silk/tables_NLSF_CB_WB.c",
                "./native/silk/tables_other.c",
                "./native/silk/tables_pitch_lag.c",
                "./native/silk/tables_pulses_per_block.c",
                "./native/silk/VAD.c",
                "./native/silk/control_audio_bandwidth.c",
                "./native/silk/quant_LTP_gains.c",
                "./native/silk/VQ_WMat_EC.c",
                "./native/silk/HP_variable_cutoff.c",
                "./native/silk/NLSF_encode.c",
                "./native/silk/NLSF_VQ.c",
                "./native/silk/NLSF_unpack.c",
                "./native/silk/NLSF_del_dec_quant.c",
                "./native/silk/process_NLSFs.c",
                "./native/silk/stereo_LR_to_MS.c",
                "./native/silk/stereo_MS_to_LR.c",
                "./native/silk/check_control_input.c",
                "./native/silk/control_SNR.c",
                "./native/silk/init_encoder.c",
                "./native/silk/control_codec.c",
                "./native/silk/A2NLSF.c",
                "./native/silk/ana_filt_bank_1.c",
                "./native/silk/biquad_alt.c",
                "./native/silk/bwexpander_32.c",
                "./native/silk/bwexpander.c",
                "./native/silk/debug.c",
                "./native/silk/decode_pitch.c",
                "./native/silk/inner_prod_aligned.c",
                "./native/silk/lin2log.c",
                "./native/silk/log2lin.c",
                "./native/silk/LPC_analysis_filter.c",
                "./native/silk/LPC_inv_pred_gain.c",
                "./native/silk/table_LSF_cos.c",
                "./native/silk/NLSF2A.c",
                "./native/silk/NLSF_stabilize.c",
                "./native/silk/NLSF_VQ_weights_laroia.c",
                "./native/silk/pitch_est_tables.c",
                "./native/silk/resampler.c",
                "./native/silk/resampler_down2_3.c",
                "./native/silk/resampler_down2.c",
                "./native/silk/resampler_private_AR2.c",
                "./native/silk/resampler_private_down_FIR.c",
                "./native/silk/resampler_private_IIR_FIR.c",
                "./native/silk/resampler_private_up2_HQ.c",
                "./native/silk/resampler_rom.c",
                "./native/silk/sigm_Q15.c",
                "./native/silk/sort.c",
                "./native/silk/sum_sqr_shift.c",
                "./native/silk/stereo_decode_pred.c",
                "./native/silk/stereo_encode_pred.c",
                "./native/silk/stereo_find_predictor.c",
                "./native/silk/stereo_quant_pred.c",
                "./native/silk/LPC_fit.c",
                "./native/silk/float/apply_sine_window_FLP.c",
                "./native/silk/float/corrMatrix_FLP.c",
                "./native/silk/float/encode_frame_FLP.c",
                "./native/silk/float/find_LPC_FLP.c",
                "./native/silk/float/find_LTP_FLP.c",
                "./native/silk/float/find_pitch_lags_FLP.c",
                "./native/silk/float/find_pred_coefs_FLP.c",
                "./native/silk/float/LPC_analysis_filter_FLP.c",
                "./native/silk/float/LTP_analysis_filter_FLP.c",
                "./native/silk/float/LTP_scale_ctrl_FLP.c",
                "./native/silk/float/noise_shape_analysis_FLP.c",
                "./native/silk/float/process_gains_FLP.c",
                "./native/silk/float/regularize_correlations_FLP.c",
                "./native/silk/float/residual_energy_FLP.c",
                "./native/silk/float/warped_autocorrelation_FLP.c",
                "./native/silk/float/wrappers_FLP.c",
                "./native/silk/float/autocorrelation_FLP.c",
                "./native/silk/float/burg_modified_FLP.c",
                "./native/silk/float/bwexpander_FLP.c",
                "./native/silk/float/energy_FLP.c",
                "./native/silk/float/inner_product_FLP.c",
                "./native/silk/float/k2a_FLP.c",
                "./native/silk/float/LPC_inv_pred_gain_FLP.c",
                "./native/silk/float/pitch_analysis_core_FLP.c",
                "./native/silk/float/scale_copy_vector_FLP.c",
                "./native/silk/float/scale_vector_FLP.c",
                "./native/silk/float/schur_FLP.c",
                "./native/silk/float/sort_FLP.c",
                "./native/src/opus.c",
                "./native/src/opus_decoder.c",
                "./native/src/opus_encoder.c",
                "./native/src/opus_multistream.c",
                "./native/src/opus_multistream_encoder.c",
                "./native/src/opus_multistream_decoder.c",
                "./native/src/repacketizer.c",
                "./native/src/opus_projection_encoder.c",
                "./native/src/opus_projection_decoder.c",
                "./native/src/mapping_matrix.c",
                "./native/src/analysis.c",
                "./native/src/mlp.c",
                "./native/src/mlp_data.c"
            ] + archSpecificSources!,
            publicHeadersPath: "./native/include",
            cSettings: [
                .headerSearchPath("./extra/config"),
                .headerSearchPath("./native"),
                .headerSearchPath("./native/include"),
                .headerSearchPath("./native/celt"),
                .headerSearchPath("./native/silk"),
                .headerSearchPath("./native/silk/float"),

                .define("_FORTIFY_SOURCE", to: "2"),

                .unsafeFlags([
                    "-g"
                ], .when(configuration: .debug)),

                .unsafeFlags([
                    "-Ofast",
                    "-flto",
                    "-fPIE",
                    "-fvisibility=hidden",
                    "-include", "config.h"
                ] + archSpecificCFlags!)
            ],
            linkerSettings: [
                .unsafeFlags([
                    "-flto",
                    "-fPIE"
                ])
            ]
        )
    ]
)
