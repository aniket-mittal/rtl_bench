// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_109571 dut (
    .i_coord(in_vec[11:0]),
    .o_seven_3(out_vec[20:14]),
    .o_seven_2(out_vec[13:7]),
    .o_seven_1(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h420;
    stim[1] = 12'h2d3;
    stim[2] = 12'he79;
    stim[3] = 12'h44a;
    stim[4] = 12'h4d8;
    stim[5] = 12'h83b;
    stim[6] = 12'h467;
    stim[7] = 12'h599;
    stim[8] = 12'hd26;
    stim[9] = 12'h9ab;
    stim[10] = 12'h9ae;
    stim[11] = 12'h179;
    stim[12] = 12'he55;
    stim[13] = 12'ha54;
    stim[14] = 12'h443;
    stim[15] = 12'hd62;
    stim[16] = 12'h088;
    stim[17] = 12'h1cb;
    stim[18] = 12'h8e8;
    stim[19] = 12'hcba;
    stim[20] = 12'hd12;
    stim[21] = 12'hbfe;
    stim[22] = 12'h21f;
    stim[23] = 12'hf73;
    stim[24] = 12'h5be;
    stim[25] = 12'hb81;
    stim[26] = 12'h4da;
    stim[27] = 12'he07;
    stim[28] = 12'h398;
    stim[29] = 12'h8ac;
    stim[30] = 12'hc9c;
    stim[31] = 12'h69c;
    stim[32] = 12'h351;
    stim[33] = 12'h7be;
    stim[34] = 12'h5eb;
    stim[35] = 12'h7a6;
    stim[36] = 12'h988;
    stim[37] = 12'hf25;
    stim[38] = 12'h5c4;
    stim[39] = 12'h44a;
    stim[40] = 12'h2f5;
    stim[41] = 12'h162;
    stim[42] = 12'he62;
    stim[43] = 12'h47b;
    stim[44] = 12'hf93;
    stim[45] = 12'h79a;
    stim[46] = 12'hb7c;
    stim[47] = 12'h1e4;
    stim[48] = 12'hc27;
    stim[49] = 12'h69f;
    stim[50] = 12'h1f7;
    stim[51] = 12'h671;
    stim[52] = 12'hecc;
    stim[53] = 12'he23;
    stim[54] = 12'heb7;
    stim[55] = 12'h0ef;
    stim[56] = 12'h576;
    stim[57] = 12'h916;
    stim[58] = 12'h692;
    stim[59] = 12'hff5;
    stim[60] = 12'h50f;
    stim[61] = 12'h27d;
    stim[62] = 12'h718;
    stim[63] = 12'he0b;
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
      expv[0] = 21'h065240;
      expv[1] = 21'h0910b0;
      expv[2] = 21'h01bc10;
      expv[3] = 21'h064c88;
      expv[4] = 21'h065080;
      expv[5] = 21'h001803;
      expv[6] = 21'h064178;
      expv[7] = 21'h048810;
      expv[8] = 21'h085202;
      expv[9] = 21'h040403;
      expv[10] = 21'h040406;
      expv[11] = 21'h1e7c10;
      expv[12] = 21'h018912;
      expv[13] = 21'h020919;
      expv[14] = 21'h064cb0;
      expv[15] = 21'h084124;
      expv[16] = 21'h100000;
      expv[17] = 21'h1e6303;
      expv[18] = 21'h000300;
      expv[19] = 21'h118188;
      expv[20] = 21'h087ca4;
      expv[21] = 21'h00c706;
      expv[22] = 21'h093c8e;
      expv[23] = 21'h03bc30;
      expv[24] = 21'h048186;
      expv[25] = 21'h00c079;
      expv[26] = 21'h065088;
      expv[27] = 21'h01a078;
      expv[28] = 21'h0c0800;
      expv[29] = 21'h000446;
      expv[30] = 21'h118846;
      expv[31] = 21'h008846;
      expv[32] = 21'h0c0979;
      expv[33] = 21'h1e0186;
      expv[34] = 21'h048303;
      expv[35] = 21'h1e0402;
      expv[36] = 21'h040000;
      expv[37] = 21'h039212;
      expv[38] = 21'h04a319;
      expv[39] = 21'h064c88;
      expv[40] = 21'h090712;
      expv[41] = 21'h1e4124;
      expv[42] = 21'h018124;
      expv[43] = 21'h067c03;
      expv[44] = 21'h038830;
      expv[45] = 21'h1e0808;
      expv[46] = 21'h00fc46;
      expv[47] = 21'h1e4319;
      expv[48] = 21'h119278;
      expv[49] = 21'h00880e;
      expv[50] = 21'h1e4778;
      expv[51] = 21'h00bc79;
      expv[52] = 21'h01a346;
      expv[53] = 21'h019230;
      expv[54] = 21'h0181f8;
      expv[55] = 21'h10030e;
      expv[56] = 21'h04bc02;
      expv[57] = 21'h043c82;
      expv[58] = 21'h008824;
      expv[59] = 21'h038712;
      expv[60] = 21'h04a00e;
      expv[61] = 21'h093c21;
      expv[62] = 21'h1e3c80;
      expv[63] = 21'h01a003;
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
