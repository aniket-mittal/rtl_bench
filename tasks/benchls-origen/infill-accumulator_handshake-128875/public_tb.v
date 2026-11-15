// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128875 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .data_in(in_vec[9:2]),
    .in_valid(in_vec[1:1]),
    .out_ready(in_vec[0:0]),
    .in_ready(out_vec[11:11]),
    .data_out(out_vec[10:1]),
    .out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h1c9;
    stim[1] = 11'h19f;
    stim[2] = 11'h5b4;
    stim[3] = 11'h7d7;
    stim[4] = 11'h568;
    stim[5] = 11'h454;
    stim[6] = 11'h514;
    stim[7] = 11'h757;
    stim[8] = 11'h74f;
    stim[9] = 11'h50e;
    stim[10] = 11'h735;
    stim[11] = 11'h635;
    stim[12] = 11'h570;
    stim[13] = 11'h4b3;
    stim[14] = 11'h53a;
    stim[15] = 11'h6e7;
    stim[16] = 11'h6ce;
    stim[17] = 11'h7dd;
    stim[18] = 11'h5bd;
    stim[19] = 11'h609;
    stim[20] = 11'h780;
    stim[21] = 11'h4f5;
    stim[22] = 11'h5fd;
    stim[23] = 11'h701;
    stim[24] = 11'h72b;
    stim[25] = 11'h483;
    stim[26] = 11'h446;
    stim[27] = 11'h525;
    stim[28] = 11'h75f;
    stim[29] = 11'h456;
    stim[30] = 11'h4fb;
    stim[31] = 11'h526;
    stim[32] = 11'h5fb;
    stim[33] = 11'h42c;
    stim[34] = 11'h650;
    stim[35] = 11'h067;
    stim[36] = 11'h6f7;
    stim[37] = 11'h6aa;
    stim[38] = 11'h6f4;
    stim[39] = 11'h57f;
    stim[40] = 11'h69e;
    stim[41] = 11'h55a;
    stim[42] = 11'h689;
    stim[43] = 11'h43b;
    stim[44] = 11'h4e1;
    stim[45] = 11'h7b8;
    stim[46] = 11'h554;
    stim[47] = 11'h7af;
    stim[48] = 11'h2f3;
    stim[49] = 11'h75f;
    stim[50] = 11'h638;
    stim[51] = 11'h481;
    stim[52] = 11'h7f0;
    stim[53] = 11'h581;
    stim[54] = 11'h558;
    stim[55] = 11'h7d2;
    stim[56] = 11'h4bc;
    stim[57] = 11'h399;
    stim[58] = 11'h7e1;
    stim[59] = 11'h692;
    stim[60] = 11'h5e8;
    stim[61] = 11'h42f;
    stim[62] = 11'h690;
    stim[63] = 11'h4f1;
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
      expv[0] = 12'h800;
      expv[1] = 12'h800;
      expv[2] = 12'h800;
      expv[3] = 12'h800;
      expv[4] = 12'h9ea;
      expv[5] = 12'h9ea;
      expv[6] = 12'h9ea;
      expv[7] = 12'h9ea;
      expv[8] = 12'hb94;
      expv[9] = 12'hd3a;
      expv[10] = 12'h5c1;
      expv[11] = 12'h800;
      expv[12] = 12'h800;
      expv[13] = 12'h800;
      expv[14] = 12'h858;
      expv[15] = 12'h8f4;
      expv[16] = 12'ha66;
      expv[17] = 12'h3cd;
      expv[18] = 12'h800;
      expv[19] = 12'h800;
      expv[20] = 12'h800;
      expv[21] = 12'h800;
      expv[22] = 12'h800;
      expv[23] = 12'h800;
      expv[24] = 12'h800;
      expv[25] = 12'h994;
      expv[26] = 12'h9d4;
      expv[27] = 12'h9f6;
      expv[28] = 12'h9f6;
      expv[29] = 12'h3a5;
      expv[30] = 12'h3a5;
      expv[31] = 12'h800;
      expv[32] = 12'h892;
      expv[33] = 12'h98e;
      expv[34] = 12'h98e;
      expv[35] = 12'h800;
      expv[36] = 12'h800;
      expv[37] = 12'h97a;
      expv[38] = 12'hace;
      expv[39] = 12'hace;
      expv[40] = 12'hb8c;
      expv[41] = 12'h4db;
      expv[42] = 12'h4db;
      expv[43] = 12'h800;
      expv[44] = 12'h81c;
      expv[45] = 12'h81c;
      expv[46] = 12'h81c;
      expv[47] = 12'h81c;
      expv[48] = 12'h800;
      expv[49] = 12'h800;
      expv[50] = 12'h9ae;
      expv[51] = 12'h9ae;
      expv[52] = 12'h9ae;
      expv[53] = 12'h9ae;
      expv[54] = 12'h9ae;
      expv[55] = 12'h9ae;
      expv[56] = 12'hb96;
      expv[57] = 12'h800;
      expv[58] = 12'h800;
      expv[59] = 12'h800;
      expv[60] = 12'h948;
      expv[61] = 12'h948;
      expv[62] = 12'h95e;
      expv[63] = 12'h95e;
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
