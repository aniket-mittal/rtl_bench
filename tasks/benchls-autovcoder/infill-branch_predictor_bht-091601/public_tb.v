// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_091601 dut (
    .equal(in_vec[19:19]),
    .judge(in_vec[18:18]),
    .intr(in_vec[17:17]),
    .BrIns(in_vec[16:10]),
    .PredictYes(in_vec[9:9]),
    .BHTItem(in_vec[8:0]),
    .PCSrc(out_vec[16:16]),
    .PostClr(out_vec[15:15]),
    .BrPCSrc2(out_vec[14:13]),
    .BrPCSrc(out_vec[12:11]),
    .ToBHT(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h623f5;
    stim[1] = 20'h99f33;
    stim[2] = 20'h5a6e0;
    stim[3] = 20'h52284;
    stim[4] = 20'ha1d3c;
    stim[5] = 20'h5d3b1;
    stim[6] = 20'h75663;
    stim[7] = 20'h41c4e;
    stim[8] = 20'h1816f;
    stim[9] = 20'h4f990;
    stim[10] = 20'hacab4;
    stim[11] = 20'h7eb78;
    stim[12] = 20'h5abd9;
    stim[13] = 20'hba9e8;
    stim[14] = 20'hf2116;
    stim[15] = 20'h7521b;
    stim[16] = 20'hf50e7;
    stim[17] = 20'hb1224;
    stim[18] = 20'hdae83;
    stim[19] = 20'heaf4e;
    stim[20] = 20'h9b7e5;
    stim[21] = 20'hbb78d;
    stim[22] = 20'he8ebe;
    stim[23] = 20'hcf856;
    stim[24] = 20'h9ccbe;
    stim[25] = 20'ha7849;
    stim[26] = 20'h55bd5;
    stim[27] = 20'hecf20;
    stim[28] = 20'h99f95;
    stim[29] = 20'h1f1ab;
    stim[30] = 20'h2e04f;
    stim[31] = 20'h0258d;
    stim[32] = 20'hcd186;
    stim[33] = 20'he771c;
    stim[34] = 20'h4e872;
    stim[35] = 20'h5f9ef;
    stim[36] = 20'h93e13;
    stim[37] = 20'hcd0a1;
    stim[38] = 20'h58c41;
    stim[39] = 20'h887a1;
    stim[40] = 20'h3b381;
    stim[41] = 20'h19356;
    stim[42] = 20'h42afc;
    stim[43] = 20'he0eaa;
    stim[44] = 20'h3667c;
    stim[45] = 20'hf35bc;
    stim[46] = 20'he3819;
    stim[47] = 20'hef051;
    stim[48] = 20'h2e2c9;
    stim[49] = 20'he60b0;
    stim[50] = 20'h547b4;
    stim[51] = 20'hb29f2;
    stim[52] = 20'h211d3;
    stim[53] = 20'h561b0;
    stim[54] = 20'hac278;
    stim[55] = 20'he9c5f;
    stim[56] = 20'h9bdc3;
    stim[57] = 20'hc9ebd;
    stim[58] = 20'h2bbb4;
    stim[59] = 20'h6c84e;
    stim[60] = 20'h76157;
    stim[61] = 20'h72b67;
    stim[62] = 20'hd9f1c;
    stim[63] = 20'ha140a;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 17'h0de3c;
      expv[1] = 17'h0362c;
      expv[2] = 17'h133ef;
      expv[3] = 17'h11aef;
      expv[4] = 17'h1f4ef;
      expv[5] = 17'h0161c;
      expv[6] = 17'h0fc2c;
      expv[7] = 17'h131ef;
      expv[8] = 17'h11528;
      expv[9] = 17'h116ef;
      expv[10] = 17'h1d2ef;
      expv[11] = 17'h1d5ef;
      expv[12] = 17'h0131c;
      expv[13] = 17'h1d7ef;
      expv[14] = 17'h1d4ef;
      expv[15] = 17'h0db2c;
      expv[16] = 17'h1d428;
      expv[17] = 17'h1d0ef;
      expv[18] = 17'h0302c;
      expv[19] = 17'h1f5ef;
      expv[20] = 17'h0343c;
      expv[21] = 17'h0f13c;
      expv[22] = 17'h1e2ef;
      expv[23] = 17'h111ef;
      expv[24] = 17'h132ef;
      expv[25] = 17'h1d108;
      expv[26] = 17'h0123c;
      expv[27] = 17'h1e4ef;
      expv[28] = 17'h0323c;
      expv[29] = 17'h11508;
      expv[30] = 17'h1d128;
      expv[31] = 17'h13918;
      expv[32] = 17'h11eef;
      expv[33] = 17'h1fcef;
      expv[34] = 17'h111ef;
      expv[35] = 17'h11528;
      expv[36] = 17'h0322c;
      expv[37] = 17'h11c08;
      expv[38] = 17'h13008;
      expv[39] = 17'h02c1c;
      expv[40] = 17'h0d01c;
      expv[41] = 17'h115ef;
      expv[42] = 17'h113ef;
      expv[43] = 17'h1e2ef;
      expv[44] = 17'h1f1ef;
      expv[45] = 17'h1f6ef;
      expv[46] = 17'h1d308;
      expv[47] = 17'h1da08;
      expv[48] = 17'h0d11c;
      expv[49] = 17'h1daef;
      expv[50] = 17'h12eef;
      expv[51] = 17'h1d7ef;
      expv[52] = 17'h1da08;
      expv[53] = 17'h11eef;
      expv[54] = 17'h1d1ef;
      expv[55] = 17'h1f328;
      expv[56] = 17'h13008;
      expv[57] = 17'h0373c;
      expv[58] = 17'h1d6ef;
      expv[59] = 17'h1d1ef;
      expv[60] = 17'h1da28;
      expv[61] = 17'h0d43c;
      expv[62] = 17'h134ef;
      expv[63] = 17'h1f8ef;
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
