// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04365 dut (
    .ACLK(clk),
    .ARESETN(in_vec[35:35]),
    .S_AXIS_TDATA(in_vec[34:3]),
    .S_AXIS_TLAST(in_vec[2:2]),
    .S_AXIS_TVALID(in_vec[1:1]),
    .M_AXIS_TREADY(in_vec[0:0]),
    .S_AXIS_TREADY(out_vec[38:38]),
    .M_AXIS_TVALID(out_vec[37:37]),
    .M_AXIS_TDATA(out_vec[36:5]),
    .M_AXIS_TLAST(out_vec[4:4]),
    .M_AXIS_TKEEP(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h402d7fa3d;
    stim[1] = 36'h2749942ac;
    stim[2] = 36'h8354137dc;
    stim[3] = 36'hec67fee9d;
    stim[4] = 36'h898ad0656;
    stim[5] = 36'hd9d142006;
    stim[6] = 36'hb5a1bcfbe;
    stim[7] = 36'hc00342377;
    stim[8] = 36'he2257c246;
    stim[9] = 36'ha92a4dd2a;
    stim[10] = 36'heae80e52d;
    stim[11] = 36'heb9179f9c;
    stim[12] = 36'hd8e94b085;
    stim[13] = 36'hbd4df2bc7;
    stim[14] = 36'ha2da5fe68;
    stim[15] = 36'hf88f5e9dc;
    stim[16] = 36'hdae5013c7;
    stim[17] = 36'h9c0df3118;
    stim[18] = 36'heae09188e;
    stim[19] = 36'hc4aac6164;
    stim[20] = 36'hcbf30ea6a;
    stim[21] = 36'h8041d95c9;
    stim[22] = 36'hdc2dcbe28;
    stim[23] = 36'hfc17fa7f1;
    stim[24] = 36'haf39e220f;
    stim[25] = 36'hfb6670624;
    stim[26] = 36'hdb22a19a1;
    stim[27] = 36'h9e594cf61;
    stim[28] = 36'h941437e11;
    stim[29] = 36'hd7c56edbf;
    stim[30] = 36'hfd13373ee;
    stim[31] = 36'h88460b400;
    stim[32] = 36'he23ad3cd5;
    stim[33] = 36'hb4bbcd158;
    stim[34] = 36'ha04ca2228;
    stim[35] = 36'hc94dde085;
    stim[36] = 36'h9446a3f8d;
    stim[37] = 36'h96bd63d31;
    stim[38] = 36'he23194319;
    stim[39] = 36'hfb35e3b0d;
    stim[40] = 36'hcecb44525;
    stim[41] = 36'hfca626bf0;
    stim[42] = 36'hc638a8786;
    stim[43] = 36'h849629433;
    stim[44] = 36'hf39fd810c;
    stim[45] = 36'h988d49938;
    stim[46] = 36'hfc73c5466;
    stim[47] = 36'he93b764ee;
    stim[48] = 36'hef47651b6;
    stim[49] = 36'h9228a4d18;
    stim[50] = 36'haa1b390d4;
    stim[51] = 36'hff15540e4;
    stim[52] = 36'h91b59d4f0;
    stim[53] = 36'hbcb45228a;
    stim[54] = 36'ha8ebba6d2;
    stim[55] = 36'hb17fc70a7;
    stim[56] = 36'hd1407fc91;
    stim[57] = 36'hf1597e7e5;
    stim[58] = 36'h9f0ca45ff;
    stim[59] = 36'ha01e2890e;
    stim[60] = 36'heeb50647d;
    stim[61] = 36'h9cfb046a8;
    stim[62] = 36'hb421bab9a;
    stim[63] = 36'h86c74d6ae;
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
      expv[0] = 39'h000000000f;
      expv[1] = 39'h000000000f;
      expv[2] = 39'h000000000f;
      expv[3] = 39'h000000000f;
      expv[4] = 39'h000000000f;
      expv[5] = 39'h400000000f;
      expv[6] = 39'h567450800f;
      expv[7] = 39'h43dcbfbeef;
      expv[8] = 39'h53dd904caf;
      expv[9] = 39'h4c66ef55af;
      expv[10] = 39'h56b182ca4f;
      expv[11] = 39'h56b182ca4f;
      expv[12] = 39'h56b182ca4f;
      expv[13] = 39'h56b182ca4f;
      expv[14] = 39'h4604ff794f;
      expv[15] = 39'h4604ff794f;
      expv[16] = 39'h4604ff794f;
      expv[17] = 39'h5cbe3fc84f;
      expv[18] = 39'h5cbe3fc84f;
      expv[19] = 39'h3776642a6f;
      expv[20] = 39'h3776642a6f;
      expv[21] = 39'h3776642a6f;
      expv[22] = 39'h3776642a6f;
      expv[23] = 39'h3776642a6f;
      expv[24] = 39'h3776642a6f;
      expv[25] = 39'h3776642a6f;
      expv[26] = 39'h3776642a6f;
      expv[27] = 39'h3776642a6f;
      expv[28] = 39'h3776642a6f;
      expv[29] = 39'h3776642a6f;
      expv[30] = 39'h3776642a6f;
      expv[31] = 39'h3776642a6f;
      expv[32] = 39'h3776642a6f;
      expv[33] = 39'h1776642a6f;
      expv[34] = 39'h1776642a6f;
      expv[35] = 39'h1776642a6f;
      expv[36] = 39'h1776642a6f;
      expv[37] = 39'h1776642a6f;
      expv[38] = 39'h1776642a6f;
      expv[39] = 39'h1776642a6f;
      expv[40] = 39'h1776642a6f;
      expv[41] = 39'h1776642a6f;
      expv[42] = 39'h1776642a6f;
      expv[43] = 39'h400000000f;
      expv[44] = 39'h41258a50cf;
      expv[45] = 39'h41258a50cf;
      expv[46] = 39'h41258a50cf;
      expv[47] = 39'h40427ba24f;
      expv[48] = 39'h5a915935ef;
      expv[49] = 39'h5663327caf;
      expv[50] = 39'h5663327caf;
      expv[51] = 39'h5663327caf;
      expv[52] = 39'h5663327caf;
      expv[53] = 39'h5663327caf;
      expv[54] = 39'h45904706cf;
      expv[55] = 39'h4fcb35a20f;
      expv[56] = 39'h5c2b27648f;
      expv[57] = 39'h5c2b27648f;
      expv[58] = 39'h5c2b27648f;
      expv[59] = 39'h23ee507c6f;
      expv[60] = 39'h23ee507c6f;
      expv[61] = 39'h23ee507c6f;
      expv[62] = 39'h23ee507c6f;
      expv[63] = 39'h23ee507c6f;
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
