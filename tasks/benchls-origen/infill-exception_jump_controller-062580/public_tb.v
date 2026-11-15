// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_062580 dut (
    .clk(clk),
    .rst(in_vec[42:42]),
    .miss(in_vec[41:41]),
    .jump(in_vec[40:40]),
    .new_PC(in_vec[39:24]),
    .branch_PC(in_vec[23:8]),
    .Mode_Set(in_vec[7:6]),
    .Bad_Instr_in(in_vec[5:5]),
    .Illegal_PC_in(in_vec[4:4]),
    .Illegal_Memory_in(in_vec[3:3]),
    .Spart_RCV_in(in_vec[2:2]),
    .Accelerator_keyfound_in(in_vec[1:1]),
    .IFID_Stall(in_vec[0:0]),
    .J_R(out_vec[19:4]),
    .J(out_vec[3:3]),
    .Mode(out_vec[2:1]),
    .Store_Current(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h5346672ba87;
    stim[1] = 43'h46da9011b8b;
    stim[2] = 43'h13cd0703400;
    stim[3] = 43'h1d5369a121f;
    stim[4] = 43'h3364768b016;
    stim[5] = 43'h0f5a06bc613;
    stim[6] = 43'h33e26a793ad;
    stim[7] = 43'h3f38199f60f;
    stim[8] = 43'h11c7a48b05a;
    stim[9] = 43'h05244bc34ec;
    stim[10] = 43'h029af29f888;
    stim[11] = 43'h1229da42ff7;
    stim[12] = 43'h183dd3be983;
    stim[13] = 43'h0d67adaa822;
    stim[14] = 43'h0fb0c639c58;
    stim[15] = 43'h056b2f60f86;
    stim[16] = 43'h25a18a43db6;
    stim[17] = 43'h37b985af411;
    stim[18] = 43'h36a85defcec;
    stim[19] = 43'h108627f49a2;
    stim[20] = 43'h07705a49c16;
    stim[21] = 43'h3bb7a4c8c3b;
    stim[22] = 43'h3252f569128;
    stim[23] = 43'h2886237c667;
    stim[24] = 43'h0e7a8d31323;
    stim[25] = 43'h2ca188ea9ef;
    stim[26] = 43'h199e8984dda;
    stim[27] = 43'h13adaf40ef6;
    stim[28] = 43'h1783f3e055a;
    stim[29] = 43'h0237ae05618;
    stim[30] = 43'h3868d20d21b;
    stim[31] = 43'h1d0fa0385e0;
    stim[32] = 43'h39def03fa14;
    stim[33] = 43'h24fa22555c1;
    stim[34] = 43'h18b79120aca;
    stim[35] = 43'h32f491515ad;
    stim[36] = 43'h179957cd199;
    stim[37] = 43'h3a0cdc876be;
    stim[38] = 43'h379904594ca;
    stim[39] = 43'h002a74d997b;
    stim[40] = 43'h7ca21f47d7d;
    stim[41] = 43'h214678b1d43;
    stim[42] = 43'h091abd7c83d;
    stim[43] = 43'h7a0d385b611;
    stim[44] = 43'h3c3ea63c2e5;
    stim[45] = 43'h3c49965a0e6;
    stim[46] = 43'h02720ef2359;
    stim[47] = 43'h32562237ce8;
    stim[48] = 43'h1d6e03bd9f8;
    stim[49] = 43'h5f665dddf15;
    stim[50] = 43'h04fdec3a1fb;
    stim[51] = 43'h3b7af1a5548;
    stim[52] = 43'h1298bd8ceb9;
    stim[53] = 43'h0f2a10cc180;
    stim[54] = 43'h3cd62edc725;
    stim[55] = 43'h30c594449d5;
    stim[56] = 43'h09644aa4f18;
    stim[57] = 43'h017a72d3edf;
    stim[58] = 43'h1ae1f7c2187;
    stim[59] = 43'h1f5b510ca47;
    stim[60] = 43'h351f8648058;
    stim[61] = 43'h05ad6714cf7;
    stim[62] = 43'h083eb29da1c;
    stim[63] = 43'h0e624fe7b30;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'h3cd08;
      expv[4] = 20'h3cd00;
      expv[5] = 20'h68b0e;
      expv[6] = 20'h0400f;
      expv[7] = 20'ha793e;
      expv[8] = 20'h99f6e;
      expv[9] = 20'h0500f;
      expv[10] = 20'h0200f;
      expv[11] = 20'h0400f;
      expv[12] = 20'h0300f;
      expv[13] = 20'h0400f;
      expv[14] = 20'h0500f;
      expv[15] = 20'h0200f;
      expv[16] = 20'h0300f;
      expv[17] = 20'ha43de;
      expv[18] = 20'h5af4e;
      expv[19] = 20'hdefce;
      expv[20] = 20'h0400f;
      expv[21] = 20'h0500f;
      expv[22] = 20'h4c8ce;
      expv[23] = 20'h5691e;
      expv[24] = 20'h37c6e;
      expv[25] = 20'h0400f;
      expv[26] = 20'h8ea9e;
      expv[27] = 20'h0500f;
      expv[28] = 20'h0200f;
      expv[29] = 20'h0400f;
      expv[30] = 20'h0500f;
      expv[31] = 20'h20d2e;
      expv[32] = 20'h0200f;
      expv[33] = 20'h03fae;
      expv[34] = 20'h2555e;
      expv[35] = 20'h0300f;
      expv[36] = 20'h1515e;
      expv[37] = 20'h0500f;
      expv[38] = 20'hc876e;
      expv[39] = 20'h4594e;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h8b1da;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h63c2e;
      expv[46] = 20'h65a0e;
      expv[47] = 20'h65a02;
      expv[48] = 20'h237ce;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00006;
      expv[52] = 20'h1a55e;
      expv[53] = 20'h0500f;
      expv[54] = 20'h0200f;
      expv[55] = 20'hedc7e;
      expv[56] = 20'h4449e;
      expv[57] = 20'h0300f;
      expv[58] = 20'h0200f;
      expv[59] = 20'h0400f;
      expv[60] = 20'h0500f;
      expv[61] = 20'h6480e;
      expv[62] = 20'h0400f;
      expv[63] = 20'h0500f;
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
