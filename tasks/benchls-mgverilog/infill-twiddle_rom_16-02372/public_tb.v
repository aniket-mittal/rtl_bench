// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02372 dut (
    .ADDR(in_vec[3:0]),
    .DATA_RE(out_vec[63:32]),
    .DATA_IM(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hd;
    stim[1] = 4'h3;
    stim[2] = 4'h4;
    stim[3] = 4'h0;
    stim[4] = 4'h1;
    stim[5] = 4'h3;
    stim[6] = 4'h8;
    stim[7] = 4'h3;
    stim[8] = 4'h2;
    stim[9] = 4'h2;
    stim[10] = 4'h9;
    stim[11] = 4'hd;
    stim[12] = 4'hb;
    stim[13] = 4'h1;
    stim[14] = 4'he;
    stim[15] = 4'h9;
    stim[16] = 4'h7;
    stim[17] = 4'h5;
    stim[18] = 4'h3;
    stim[19] = 4'hd;
    stim[20] = 4'he;
    stim[21] = 4'ha;
    stim[22] = 4'h9;
    stim[23] = 4'h3;
    stim[24] = 4'h1;
    stim[25] = 4'h1;
    stim[26] = 4'h0;
    stim[27] = 4'h0;
    stim[28] = 4'hd;
    stim[29] = 4'h7;
    stim[30] = 4'h4;
    stim[31] = 4'h2;
    stim[32] = 4'h5;
    stim[33] = 4'h8;
    stim[34] = 4'h9;
    stim[35] = 4'h4;
    stim[36] = 4'h8;
    stim[37] = 4'he;
    stim[38] = 4'h7;
    stim[39] = 4'h4;
    stim[40] = 4'h3;
    stim[41] = 4'he;
    stim[42] = 4'hc;
    stim[43] = 4'h0;
    stim[44] = 4'h3;
    stim[45] = 4'hc;
    stim[46] = 4'ha;
    stim[47] = 4'h1;
    stim[48] = 4'h0;
    stim[49] = 4'h1;
    stim[50] = 4'ha;
    stim[51] = 4'hb;
    stim[52] = 4'hb;
    stim[53] = 4'h0;
    stim[54] = 4'h1;
    stim[55] = 4'he;
    stim[56] = 4'hb;
    stim[57] = 4'h1;
    stim[58] = 4'hf;
    stim[59] = 4'h1;
    stim[60] = 4'hf;
    stim[61] = 4'hd;
    stim[62] = 4'h6;
    stim[63] = 4'h6;
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
      expv[0] = 64'hffff2b25ffff71c6;
      expv[1] = 64'h0000d4dbffff71c6;
      expv[2] = 64'h0000b505ffff4afb;
      expv[3] = 64'h0001000000000000;
      expv[4] = 64'h0000fb15ffffce0f;
      expv[5] = 64'h0000d4dbffff71c6;
      expv[6] = 64'h00000000ffff0000;
      expv[7] = 64'h0000d4dbffff71c6;
      expv[8] = 64'h0000ec83ffff9e08;
      expv[9] = 64'h0000ec83ffff9e08;
      expv[10] = 64'hffffce0fffff04eb;
      expv[11] = 64'hffff2b25ffff71c6;
      expv[12] = 64'hffff71c6ffff2b25;
      expv[13] = 64'h0000fb15ffffce0f;
      expv[14] = 64'hffff137dffff9e08;
      expv[15] = 64'hffffce0fffff04eb;
      expv[16] = 64'h000031f1ffff04eb;
      expv[17] = 64'h00008e3affff2b25;
      expv[18] = 64'h0000d4dbffff71c6;
      expv[19] = 64'hffff2b25ffff71c6;
      expv[20] = 64'hffff137dffff9e08;
      expv[21] = 64'hffff9e08ffff137d;
      expv[22] = 64'hffffce0fffff04eb;
      expv[23] = 64'h0000d4dbffff71c6;
      expv[24] = 64'h0000fb15ffffce0f;
      expv[25] = 64'h0000fb15ffffce0f;
      expv[26] = 64'h0001000000000000;
      expv[27] = 64'h0001000000000000;
      expv[28] = 64'hffff2b25ffff71c6;
      expv[29] = 64'h000031f1ffff04eb;
      expv[30] = 64'h0000b505ffff4afb;
      expv[31] = 64'h0000ec83ffff9e08;
      expv[32] = 64'h00008e3affff2b25;
      expv[33] = 64'h00000000ffff0000;
      expv[34] = 64'hffffce0fffff04eb;
      expv[35] = 64'h0000b505ffff4afb;
      expv[36] = 64'h00000000ffff0000;
      expv[37] = 64'hffff137dffff9e08;
      expv[38] = 64'h000031f1ffff04eb;
      expv[39] = 64'h0000b505ffff4afb;
      expv[40] = 64'h0000d4dbffff71c6;
      expv[41] = 64'hffff137dffff9e08;
      expv[42] = 64'hffff4afbffff4afb;
      expv[43] = 64'h0001000000000000;
      expv[44] = 64'h0000d4dbffff71c6;
      expv[45] = 64'hffff4afbffff4afb;
      expv[46] = 64'hffff9e08ffff137d;
      expv[47] = 64'h0000fb15ffffce0f;
      expv[48] = 64'h0001000000000000;
      expv[49] = 64'h0000fb15ffffce0f;
      expv[50] = 64'hffff9e08ffff137d;
      expv[51] = 64'hffff71c6ffff2b25;
      expv[52] = 64'hffff71c6ffff2b25;
      expv[53] = 64'h0001000000000000;
      expv[54] = 64'h0000fb15ffffce0f;
      expv[55] = 64'hffff137dffff9e08;
      expv[56] = 64'hffff71c6ffff2b25;
      expv[57] = 64'h0000fb15ffffce0f;
      expv[58] = 64'hffff04ebffffce0f;
      expv[59] = 64'h0000fb15ffffce0f;
      expv[60] = 64'hffff04ebffffce0f;
      expv[61] = 64'hffff2b25ffff71c6;
      expv[62] = 64'h000061f8ffff137d;
      expv[63] = 64'h000061f8ffff137d;
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
