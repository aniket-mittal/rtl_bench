// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_001240 dut (
    .data_get_complete(clk),
    .data_changing(in_vec[54:54]),
    .data_warn(in_vec[53:42]),
    .ds_data(in_vec[41:30]),
    .p_para(in_vec[29:20]),
    .i_para(in_vec[19:10]),
    .d_para(in_vec[9:0]),
    .heater_open(out_vec[18:18]),
    .fan_open(out_vec[17:17]),
    .work_c(out_vec[16:16]),
    .high_len(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h0a972e59fa2bca;
    stim[1] = 55'h341afb9aefcd63;
    stim[2] = 55'h3e0843ba422cea;
    stim[3] = 55'h2e31241cea9b89;
    stim[4] = 55'h5dd9374de8479d;
    stim[5] = 55'h2002460951a6b8;
    stim[6] = 55'h6c1e6499426dd9;
    stim[7] = 55'h61135d056bff3a;
    stim[8] = 55'h72b1c2d0b4e1c2;
    stim[9] = 55'h6f06a085c586bf;
    stim[10] = 55'h0d56bd37a8f23f;
    stim[11] = 55'h7271c0d48bbdb7;
    stim[12] = 55'h59bd8b050b508e;
    stim[13] = 55'h602048615207e6;
    stim[14] = 55'h351cb4cb8bf171;
    stim[15] = 55'h0edc10fe53b4f8;
    stim[16] = 55'h082dba4b1a1467;
    stim[17] = 55'h5216cc586827c9;
    stim[18] = 55'h1f826d80be63db;
    stim[19] = 55'h45a170a3d28a84;
    stim[20] = 55'h163de6a503bbb7;
    stim[21] = 55'h24e0777e6a778f;
    stim[22] = 55'h05813d63b1c35f;
    stim[23] = 55'h70de9d42e15a9d;
    stim[24] = 55'h6545dfeab76524;
    stim[25] = 55'h60bb76f267f750;
    stim[26] = 55'h144dd1d9c5013b;
    stim[27] = 55'h03d7f2712df688;
    stim[28] = 55'h37a35fd361e366;
    stim[29] = 55'h0e31507d6e12b9;
    stim[30] = 55'h00204e1e7e0401;
    stim[31] = 55'h2582cd84e7247d;
    stim[32] = 55'h1183df5ebe8f4d;
    stim[33] = 55'h457b35d9996de6;
    stim[34] = 55'h40f4ed657ec3ad;
    stim[35] = 55'h663c6a5c8edecc;
    stim[36] = 55'h19f0af2f048a8f;
    stim[37] = 55'h660c99507e872c;
    stim[38] = 55'h296fdff5e726e1;
    stim[39] = 55'h720fb18f821ae4;
    stim[40] = 55'h0c745eac3e9642;
    stim[41] = 55'h2e75fbb72778fa;
    stim[42] = 55'h42bc22281f3688;
    stim[43] = 55'h3c55b6ae83a216;
    stim[44] = 55'h19bd12b751f521;
    stim[45] = 55'h1743d307f94c5d;
    stim[46] = 55'h7b8912d182b781;
    stim[47] = 55'h184ff33fc1a3b3;
    stim[48] = 55'h3089324f368822;
    stim[49] = 55'h341b3134edac5c;
    stim[50] = 55'h49556796dd6e80;
    stim[51] = 55'h0a2164b8b55471;
    stim[52] = 55'h23a98cce3821a7;
    stim[53] = 55'h0699a2017f7785;
    stim[54] = 55'h697e819343bcb8;
    stim[55] = 55'h2686408a03569c;
    stim[56] = 55'h0f8b4ded80690c;
    stim[57] = 55'h7e697ef37090bd;
    stim[58] = 55'h2a8b83d290fb36;
    stim[59] = 55'h66b0aafb571db2;
    stim[60] = 55'h5215bb9ead8066;
    stim[61] = 55'h3356bacc032d51;
    stim[62] = 55'h29675ce391295b;
    stim[63] = 55'h4f6df5c98b832e;
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
      expv[0] = 19'hxxxxx;
      expv[1] = 19'hxxxxx;
      expv[2] = 19'hxxxxx;
      expv[3] = 19'h5xxxx;
      expv[4] = 19'h5xxxx;
      expv[5] = 19'h00000;
      expv[6] = 19'h10000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h10000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h10000;
      expv[16] = 19'h5xxxx;
      expv[17] = 19'h30000;
      expv[18] = 19'h00000;
      expv[19] = 19'h10000;
      expv[20] = 19'h00000;
      expv[21] = 19'h10000;
      expv[22] = 19'h50098;
      expv[23] = 19'h30000;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h10000;
      expv[28] = 19'h30419;
      expv[29] = 19'h50000;
      expv[30] = 19'h3005a;
      expv[31] = 19'h30238;
      expv[32] = 19'h30832;
      expv[33] = 19'h309e8;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h10000;
      expv[38] = 19'h00000;
      expv[39] = 19'h10000;
      expv[40] = 19'h00000;
      expv[41] = 19'h10000;
      expv[42] = 19'h5231e;
      expv[43] = 19'h00000;
      expv[44] = 19'h10000;
      expv[45] = 19'h50000;
      expv[46] = 19'h30000;
      expv[47] = 19'h00000;
      expv[48] = 19'h10000;
      expv[49] = 19'h50044;
      expv[50] = 19'h50000;
      expv[51] = 19'h00000;
      expv[52] = 19'h10000;
      expv[53] = 19'h50612;
      expv[54] = 19'h30000;
      expv[55] = 19'h00000;
      expv[56] = 19'h10000;
      expv[57] = 19'h3000f;
      expv[58] = 19'h00000;
      expv[59] = 19'h10000;
      expv[60] = 19'h00000;
      expv[61] = 19'h00000;
      expv[62] = 19'h10000;
      expv[63] = 19'h30000;
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
