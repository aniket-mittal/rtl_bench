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

  rtlpp_00292 dut (
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
    stim[0] = 40'h5425e87eca;
    stim[1] = 40'h04dd97881d;
    stim[2] = 40'hcd4d4bc9a3;
    stim[3] = 40'haa46fbb78f;
    stim[4] = 40'hfc1e2f3310;
    stim[5] = 40'h885f684d4e;
    stim[6] = 40'hfb98e5eabd;
    stim[7] = 40'hf1d00e789e;
    stim[8] = 40'ha7608467f2;
    stim[9] = 40'h84558854f1;
    stim[10] = 40'hb7fbd5811a;
    stim[11] = 40'hf9391b170c;
    stim[12] = 40'h85f87332ac;
    stim[13] = 40'h99b10e5d96;
    stim[14] = 40'heddbc02610;
    stim[15] = 40'h95f718a63f;
    stim[16] = 40'he1c4f4763a;
    stim[17] = 40'h957d2ad733;
    stim[18] = 40'hc32ac9f1b6;
    stim[19] = 40'hdf6980ab30;
    stim[20] = 40'hccda2cb81e;
    stim[21] = 40'hf78dfb3c23;
    stim[22] = 40'h9dbf2c844c;
    stim[23] = 40'hd0500f52b7;
    stim[24] = 40'hd8f8911a81;
    stim[25] = 40'ha6837d045b;
    stim[26] = 40'ha5b76303ab;
    stim[27] = 40'hc806740899;
    stim[28] = 40'hbb4db32d02;
    stim[29] = 40'h8dff9049f5;
    stim[30] = 40'he984ac5731;
    stim[31] = 40'hc8900adca0;
    stim[32] = 40'h14610f3bae;
    stim[33] = 40'hd7e0b1fc98;
    stim[34] = 40'h8542e5416a;
    stim[35] = 40'ha6dc675b0f;
    stim[36] = 40'h9aabfec5cb;
    stim[37] = 40'hed6c88c8b8;
    stim[38] = 40'he0017abaa8;
    stim[39] = 40'ha115359ad6;
    stim[40] = 40'ha07b8ab534;
    stim[41] = 40'hb1ffba897a;
    stim[42] = 40'hd69ddee8d6;
    stim[43] = 40'hb0170f94ff;
    stim[44] = 40'h8fa0a54236;
    stim[45] = 40'hb30805022d;
    stim[46] = 40'h8b78ab1381;
    stim[47] = 40'h8439093856;
    stim[48] = 40'hf499aa2843;
    stim[49] = 40'ha2c3c0297a;
    stim[50] = 40'h96b2bb99f9;
    stim[51] = 40'hbcba3143d6;
    stim[52] = 40'he0f697f21e;
    stim[53] = 40'h9242067c5b;
    stim[54] = 40'ha91d60c00b;
    stim[55] = 40'hbf34a66e58;
    stim[56] = 40'h013dac6020;
    stim[57] = 40'h97a1bfd0d4;
    stim[58] = 40'h8954a42b33;
    stim[59] = 40'h5c8424a18d;
    stim[60] = 40'haaa0b12cc1;
    stim[61] = 40'h997b630123;
    stim[62] = 40'hf9bf46196c;
    stim[63] = 40'hd4bec54483;
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
      expv[3] = 44'h00000000000;
      expv[4] = 44'h84000000000;
      expv[5] = 44'h9c083c5e662;
      expv[6] = 44'h9c083c5e662;
      expv[7] = 44'h9c083c5e662;
      expv[8] = 44'h9403a01cf13;
      expv[9] = 44'h9403a01cf13;
      expv[10] = 44'h8408ab10a9e;
      expv[11] = 44'h8408ab10a9e;
      expv[12] = 44'h9c0272362e1;
      expv[13] = 44'h9c0272362e1;
      expv[14] = 44'h9c0272362e1;
      expv[15] = 44'h9c0272362e1;
      expv[16] = 44'h940bee314c7;
      expv[17] = 44'h940bee314c7;
      expv[18] = 44'h940afa55ae6;
      expv[19] = 44'h940afa55ae6;
      expv[20] = 44'h940afa55ae6;
      expv[21] = 44'h940afa55ae6;
      expv[22] = 44'h940afa55ae6;
      expv[23] = 44'h9c0b7e59089;
      expv[24] = 44'h9c0b7e59089;
      expv[25] = 44'h9c0b7e59089;
      expv[26] = 44'h9c0b7e59089;
      expv[27] = 44'h840b6ec6075;
      expv[28] = 44'h840b6ec6075;
      expv[29] = 44'h840b6ec6075;
      expv[30] = 44'h8c0bff2093e;
      expv[31] = 44'h8c0bff2093e;
      expv[32] = 44'h00000000000;
      expv[33] = 44'h00000000000;
      expv[34] = 44'h00000000000;
      expv[35] = 44'h00000000000;
      expv[36] = 44'h84000000000;
      expv[37] = 44'h9c0557fd8b9;
      expv[38] = 44'h9c0557fd8b9;
      expv[39] = 44'h840002f5755;
      expv[40] = 44'h840002f5755;
      expv[41] = 44'h8400f7156a6;
      expv[42] = 44'h8400f7156a6;
      expv[43] = 44'h940d3bbdd1a;
      expv[44] = 44'h940d3bbdd1a;
      expv[45] = 44'h8c0f414a846;
      expv[46] = 44'h8c0f414a846;
      expv[47] = 44'h8c06f156270;
      expv[48] = 44'h8c06f156270;
      expv[49] = 44'h8c06f156270;
      expv[50] = 44'h8405878052f;
      expv[51] = 44'h8405878052f;
      expv[52] = 44'h8405878052f;
      expv[53] = 44'h8401ed2fe43;
      expv[54] = 44'h8401ed2fe43;
      expv[55] = 44'h8401ed2fe43;
      expv[56] = 44'h00000000000;
      expv[57] = 44'h00000000000;
      expv[58] = 44'h00000000000;
      expv[59] = 44'h00000000000;
      expv[60] = 44'h00000000000;
      expv[61] = 44'h84000000000;
      expv[62] = 44'h9c02f6c6024;
      expv[63] = 44'h9c02f6c6024;
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
