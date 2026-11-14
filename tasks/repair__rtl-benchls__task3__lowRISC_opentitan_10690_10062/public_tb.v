// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pwm_chan dut (
    .clk_i(clk),
    .rst_ni(in_vec[106:106]),
    .pwm_en_i(in_vec[105:105]),
    .invert_i(in_vec[104:104]),
    .blink_en_i(in_vec[103:103]),
    .htbt_en_i(in_vec[102:102]),
    .phase_delay_i(in_vec[101:86]),
    .duty_cycle_a_i(in_vec[85:70]),
    .duty_cycle_b_i(in_vec[69:54]),
    .blink_param_x_i(in_vec[53:38]),
    .blink_param_y_i(in_vec[37:22]),
    .phase_ctr_i(in_vec[21:6]),
    .cycle_end_i(in_vec[5:5]),
    .clr_blink_cntr_i(in_vec[4:4]),
    .dc_resn_i(in_vec[3:0]),
    .pwm_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h045812fddeec68c5708e961ea15;
    stim[1] = 107'h014efa1e427da1c23dfff3f39aa;
    stim[2] = 107'h4ed0478ad4c8cd6e1510cba5be7;
    stim[3] = 107'h7ed69ed886fb5c3a66de9bb53ea;
    stim[4] = 107'h76f5fc3e10c72a7885f82a491ec;
    stim[5] = 107'h5538d7f95ff647a7dddb5e27ac7;
    stim[6] = 107'h564acffe2ba7546d76e8a6d91b2;
    stim[7] = 107'h7f48ca35186d1d7be79e4f7a853;
    stim[8] = 107'h56ca284fe2e40c826f076247292;
    stim[9] = 107'h5d239f802d00d018939868e75b9;
    stim[10] = 107'h73f57410860052306b53746c084;
    stim[11] = 107'h5f882b07b57df285d8b95108311;
    stim[12] = 107'h44101a83f918b4624b0986fcfbf;
    stim[13] = 107'h4db6c92481947b23a2c09a6cba3;
    stim[14] = 107'h7f8040c9b34f3d9caa416540e2b;
    stim[15] = 107'h7b0cd50f79d39f60e239e1ebef0;
    stim[16] = 107'h5b8c2c136f2a6efcb2764f5dff2;
    stim[17] = 107'h775121f926d0cb5cf3b4fe07ce6;
    stim[18] = 107'h5284f99eda224a1b29f4e424645;
    stim[19] = 107'h65d2ad35bbd2b3d5568bc9f2c48;
    stim[20] = 107'h52b527d93e6be58af8306afd8bd;
    stim[21] = 107'h4cb04ccc72d54ddb97b06f28864;
    stim[22] = 107'h50c23c5f01173d84c3e0a676587;
    stim[23] = 107'h5b6d3d3e33828dad2ed60feb51b;
    stim[24] = 107'h5267b9eab95f8608767d9ef31f3;
    stim[25] = 107'h6b247d86ef444c1072a31354584;
    stim[26] = 107'h540e706e0f7e1823dded6a94177;
    stim[27] = 107'h43b54588291a3dc93b180e825dd;
    stim[28] = 107'h4d00dab3ad6b0b63ef9005fd0cc;
    stim[29] = 107'h5db92a707e78a2b5ac8dad7ad10;
    stim[30] = 107'h5be9c9f48f9c0a1003313f54b07;
    stim[31] = 107'h4aada1c33969f0b8b841a10993a;
    stim[32] = 107'h58bcb13ae4b2ad49efb9eb5e6c8;
    stim[33] = 107'h4fad59b04f3dea3c288c1d3f1a7;
    stim[34] = 107'h4463bae6336733847a035010be3;
    stim[35] = 107'h6a59ac1e3a20b6a040778a016fa;
    stim[36] = 107'h6780141fd534d6bf7dfda4f735d;
    stim[37] = 107'h5ed3020c2cc290070c7a1fded59;
    stim[38] = 107'h5f89ab12d90dd6b7faf687fd5f3;
    stim[39] = 107'h4f74b6ef7d68672a9c3508c7460;
    stim[40] = 107'h46c39bd29503cffea2ba8252447;
    stim[41] = 107'h52e369abfa00fd4ae52b1764176;
    stim[42] = 107'h513b183a8e25cb1672c8134157c;
    stim[43] = 107'h5e814a9ad0392e1f9c85d04e2a2;
    stim[44] = 107'h4cf6c6a174b85a15bb0fb80bf5f;
    stim[45] = 107'h4342c04e39067e45abd28b29c15;
    stim[46] = 107'h423aa8b694bdf3890afe7804b09;
    stim[47] = 107'h4d63b84a7c2ab339cbba6e041dc;
    stim[48] = 107'h6acf57dba233f4172c3ca0f3ed9;
    stim[49] = 107'h7f635819e37971ef79125f22114;
    stim[50] = 107'h5630d2e6a6b077407f06621eb40;
    stim[51] = 107'h74f35f5843587a8357bb641df60;
    stim[52] = 107'h6f37a80279dd37b278bb249e816;
    stim[53] = 107'h4143760386ef33dc9e8496e9b8d;
    stim[54] = 107'h7bb482c1cb9b7018d5048111021;
    stim[55] = 107'h64781b0fd09ce85d1092f60f791;
    stim[56] = 107'h4afa26fc48112803463c35e7747;
    stim[57] = 107'h05828922f4ebeafb346e27f16d4;
    stim[58] = 107'h7610959abda758d3889c640eea7;
    stim[59] = 107'h69d3cbe3dc625ded4fc1c25c372;
    stim[60] = 107'h6214931d2491bd37b1c52ff1a8a;
    stim[61] = 107'h4d480b9f15a741ea427b09197fe;
    stim[62] = 107'h468df8556203ba4318c9032445d;
    stim[63] = 107'h42e8dfd6bf15da6b257fe4ce402;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
