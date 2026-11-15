// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00300 dut (
    .clk(clk),
    .reset_n(in_vec[39:39]),
    .inverse(in_vec[38:38]),
    .sink_valid(in_vec[37:37]),
    .sink_sop(in_vec[36:36]),
    .sink_eop(in_vec[35:35]),
    .sink_real(in_vec[34:19]),
    .sink_imag(in_vec[18:3]),
    .sink_error(in_vec[2:1]),
    .source_ready(in_vec[0:0]),
    .sink_ready(out_vec[43:43]),
    .source_error(out_vec[42:41]),
    .source_sop(out_vec[40:40]),
    .source_eop(out_vec[39:39]),
    .source_valid(out_vec[38:38]),
    .source_exp(out_vec[37:32]),
    .source_real(out_vec[31:16]),
    .source_imag(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h66f6cc1b23;
    stim[1] = 40'h4f4f94312d;
    stim[2] = 40'hef6af9819f;
    stim[3] = 40'h8039609b53;
    stim[4] = 40'hb21ed9467c;
    stim[5] = 40'hc7e70680ac;
    stim[6] = 40'he56a652c58;
    stim[7] = 40'ha45a1ee5b7;
    stim[8] = 40'hd93b462a83;
    stim[9] = 40'ha9ab966d2f;
    stim[10] = 40'he42124ce36;
    stim[11] = 40'ha5f2fd1d67;
    stim[12] = 40'he68bb448ca;
    stim[13] = 40'had274f4e9b;
    stim[14] = 40'hdb718c0cc1;
    stim[15] = 40'h880cecf54b;
    stim[16] = 40'hf1bc785f17;
    stim[17] = 40'h9bd070d322;
    stim[18] = 40'h99b73cd439;
    stim[19] = 40'hca06226d0c;
    stim[20] = 40'he781d88ec6;
    stim[21] = 40'hd5990ef988;
    stim[22] = 40'hc771d6c09d;
    stim[23] = 40'he42e1cb7c3;
    stim[24] = 40'hffbc1f81fd;
    stim[25] = 40'hef63e921d6;
    stim[26] = 40'h8ac2ee460a;
    stim[27] = 40'h99488d494f;
    stim[28] = 40'hf4bc36e886;
    stim[29] = 40'hfa94de1a99;
    stim[30] = 40'h8169936b68;
    stim[31] = 40'he6252722d4;
    stim[32] = 40'hba28413317;
    stim[33] = 40'hc6c0631c93;
    stim[34] = 40'hbcc3342f39;
    stim[35] = 40'ha72d8639fb;
    stim[36] = 40'hf38a1b9b3d;
    stim[37] = 40'he168eff392;
    stim[38] = 40'hc62fd166e1;
    stim[39] = 40'h8f9f8f106e;
    stim[40] = 40'h8e1157cdb8;
    stim[41] = 40'he4723aeead;
    stim[42] = 40'hb30f48972d;
    stim[43] = 40'h9216bfd4be;
    stim[44] = 40'he51fa71585;
    stim[45] = 40'hf80900e93d;
    stim[46] = 40'hbcf6ee87bc;
    stim[47] = 40'ha851d1718e;
    stim[48] = 40'hcdc0784497;
    stim[49] = 40'hbb3d849133;
    stim[50] = 40'h91356a89bc;
    stim[51] = 40'h9291669b41;
    stim[52] = 40'hf4d44775e1;
    stim[53] = 40'he5ffe7622a;
    stim[54] = 40'he6c01c32cb;
    stim[55] = 40'hf08f306969;
    stim[56] = 40'h96b1aa6669;
    stim[57] = 40'h56062bce4d;
    stim[58] = 40'h803a96c8d2;
    stim[59] = 40'hca92afab13;
    stim[60] = 40'hbcfb92f775;
    stim[61] = 40'h911e3a70c2;
    stim[62] = 40'hee274f9808;
    stim[63] = 40'h9b986ff36c;
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
      expv[0] = 44'h00000000000;
      expv[1] = 44'h00000000000;
      expv[2] = 44'h00000000000;
      expv[3] = 44'hec0ed5f3033;
      expv[4] = 44'h200072c136a;
      expv[5] = 44'hd4043db28cf;
      expv[6] = 44'h400fce0d015;
      expv[7] = 44'h840ad4ca58b;
      expv[8] = 44'he408b43dcb6;
      expv[9] = 44'h3802768c550;
      expv[10] = 44'hec03572cda5;
      expv[11] = 44'he40842499c6;
      expv[12] = 44'he40be5fa3ac;
      expv[13] = 44'ha40d1768919;
      expv[14] = 44'hac0a4e9e9d3;
      expv[15] = 44'h1806e318198;
      expv[16] = 44'h280019d9ea9;
      expv[17] = 44'hf40378f0be2;
      expv[18] = 44'h3807a0e1a64;
      expv[19] = 44'h18036e79a87;
      expv[20] = 44'h48040c44da1;
      expv[21] = 44'he40f03b11d8;
      expv[22] = 44'h100b321df31;
      expv[23] = 44'h400ee3ad813;
      expv[24] = 44'ha4085c396f8;
      expv[25] = 44'hdc0f783f03f;
      expv[26] = 44'hec0ec7d243a;
      expv[27] = 44'h280585dc8c1;
      expv[28] = 44'h7802911a929;
      expv[29] = 44'hf409786dd10;
      expv[30] = 44'h9c0529bc353;
      expv[31] = 44'h0002d326d6d;
      expv[32] = 44'hc40c4a4e45a;
      expv[33] = 44'hfc045082662;
      expv[34] = 44'h200d80c6392;
      expv[35] = 44'h9c0986685e7;
      expv[36] = 44'ha40e5b0c73f;
      expv[37] = 44'hd4071437367;
      expv[38] = 44'ha402d1dfe72;
      expv[39] = 44'h000c5fa2cdc;
      expv[40] = 44'h680f3f1e20d;
      expv[41] = 44'h080c22af9b7;
      expv[42] = 44'hc408e475dd5;
      expv[43] = 44'hd4061e912e5;
      expv[44] = 44'h70042d7fa97;
      expv[45] = 44'hc40a3f4e2b0;
      expv[46] = 44'hdc001201d27;
      expv[47] = 44'hdc09eddd0f7;
      expv[48] = 44'hec00a3a2e31;
      expv[49] = 44'h680b80f0892;
      expv[50] = 44'hbc067b09226;
      expv[51] = 44'h50026ad5137;
      expv[52] = 44'h100522cd368;
      expv[53] = 44'h9409a88eebc;
      expv[54] = 44'ha40bffcec45;
      expv[55] = 44'ha40d8038659;
      expv[56] = 44'h94011e60d2d;
      expv[57] = 44'h00000000000;
      expv[58] = 44'h00000000000;
      expv[59] = 44'h2000752d91a;
      expv[60] = 44'h2805255f562;
      expv[61] = 44'hdc09f725eee;
      expv[62] = 44'h30023c74e18;
      expv[63] = 44'h8c0c4e9f301;
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
