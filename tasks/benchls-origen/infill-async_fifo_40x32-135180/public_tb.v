// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135180 dut (
    .rdclk(clk),
    .aclr(in_vec[43:43]),
    .data(in_vec[42:3]),
    .rdreq(in_vec[2:2]),
    .wrclk(in_vec[1:1]),
    .wrreq(in_vec[0:0]),
    .q(out_vec[51:12]),
    .rdempty(out_vec[11:11]),
    .rdusedw(out_vec[10:6]),
    .wrfull(out_vec[5:5]),
    .wrusedw(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'hc4a588f8532;
    stim[1] = 44'h9b1fb29a3dc;
    stim[2] = 44'h3d5982824fe;
    stim[3] = 44'h0a787b8bfa3;
    stim[4] = 44'h75606173e65;
    stim[5] = 44'h66d2a5895b0;
    stim[6] = 44'h6f9434c22a8;
    stim[7] = 44'h1c6e497b1ce;
    stim[8] = 44'h64df1bf8499;
    stim[9] = 44'h10065ab2458;
    stim[10] = 44'h26b5a6040a7;
    stim[11] = 44'h38222c34b48;
    stim[12] = 44'h2016667e22f;
    stim[13] = 44'h0ee3add2a6d;
    stim[14] = 44'h6ee3bea19fd;
    stim[15] = 44'h36b3f0be78d;
    stim[16] = 44'h78ba42eb0bb;
    stim[17] = 44'h20bf79658c5;
    stim[18] = 44'h743856fdd2a;
    stim[19] = 44'h68b3ccb9bf0;
    stim[20] = 44'h7ba6e7669f5;
    stim[21] = 44'h17bb8382df0;
    stim[22] = 44'h0d22372a994;
    stim[23] = 44'h4987128277a;
    stim[24] = 44'h338045a987d;
    stim[25] = 44'h472eef1f713;
    stim[26] = 44'h2e2c2797152;
    stim[27] = 44'h24ce4f65db3;
    stim[28] = 44'h537c227fb44;
    stim[29] = 44'h1e69e7614a1;
    stim[30] = 44'h0e5831f7ea1;
    stim[31] = 44'h594e25a9282;
    stim[32] = 44'h3aec687e470;
    stim[33] = 44'h640848b6aa9;
    stim[34] = 44'h2d6372afae3;
    stim[35] = 44'h6dd3f880b63;
    stim[36] = 44'h10dd03de282;
    stim[37] = 44'h2aedf762782;
    stim[38] = 44'h7301eb81668;
    stim[39] = 44'h20332e59931;
    stim[40] = 44'h18b9084c768;
    stim[41] = 44'h36949ea4d9d;
    stim[42] = 44'h3fd47b08f09;
    stim[43] = 44'h5a893a054a8;
    stim[44] = 44'h5c5f0d30feb;
    stim[45] = 44'h1dbf2f536ce;
    stim[46] = 44'h64d681c16e4;
    stim[47] = 44'h6fce0ca5f07;
    stim[48] = 44'h51c4ab2be34;
    stim[49] = 44'h32c79ba54f5;
    stim[50] = 44'h395e0369621;
    stim[51] = 44'h342c4a77a67;
    stim[52] = 44'h7eb6de36569;
    stim[53] = 44'h78b0d80170b;
    stim[54] = 44'h611c4eda8c1;
    stim[55] = 44'h650ff5f6c35;
    stim[56] = 44'h1ae46155241;
    stim[57] = 44'h19e4e465a4a;
    stim[58] = 44'h1c6e1af331b;
    stim[59] = 44'h72c0a3a82d9;
    stim[60] = 44'h4b319f6330d;
    stim[61] = 44'h2ee5c468faf;
    stim[62] = 44'h41ab9f2d0bd;
    stim[63] = 44'h418c8ef553a;
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
      expv[0] = 52'hxxxxxxxxxx800;
      expv[1] = 52'hxxxxxxxxxx800;
      expv[2] = 52'hxxxxxxxxxx800;
      expv[3] = 52'hxxxxxxxxxx000;
      expv[4] = 52'hxxxxxxxxxx000;
      expv[5] = 52'hxxxxxxxxxx7c0;
      expv[6] = 52'hxxxxxxxxxx7c0;
      expv[7] = 52'hxxxxxxxxxx7df;
      expv[8] = 52'hxxxxxxxxxx79f;
      expv[9] = 52'hxxxxxxxxxx79f;
      expv[10] = 52'hxxxxxxxxxx79f;
      expv[11] = 52'hxxxxxxxxxx79f;
      expv[12] = 52'hxxxxxxxxxx79f;
      expv[13] = 52'hxxxxxxxxxx79f;
      expv[14] = 52'hxxxxxxxxxx75f;
      expv[15] = 52'hxxxxxxxxxx71f;
      expv[16] = 52'hxxxxxxxxxx6dd;
      expv[17] = 52'hxxxxxxxxxx71d;
      expv[18] = 52'hxxxxxxxxxx6d9;
      expv[19] = 52'hxxxxxxxxxx6d9;
      expv[20] = 52'hxxxxxxxxxx6d9;
      expv[21] = 52'hxxxxxxxxxx699;
      expv[22] = 52'hxxxxxxxxxx699;
      expv[23] = 52'hxxxxxxxxxx65b;
      expv[24] = 52'hxxxxxxxxxx65b;
      expv[25] = 52'hxxxxxxxxxx61b;
      expv[26] = 52'hxxxxxxxxxx69b;
      expv[27] = 52'hxxxxxxxxxx69b;
      expv[28] = 52'hxxxxxxxxxx69b;
      expv[29] = 52'hxxxxxxxxxx65b;
      expv[30] = 52'hxxxxxxxxxx65b;
      expv[31] = 52'hxxxxxxxxxx655;
      expv[32] = 52'hxxxxxxxxxx655;
      expv[33] = 52'hxxxxxxxxxx655;
      expv[34] = 52'hxxxxxxxxxx656;
      expv[35] = 52'hxxxxxxxxxx616;
      expv[36] = 52'hxxxxxxxxxx616;
      expv[37] = 52'hxxxxxxxxxx616;
      expv[38] = 52'hxxxxxxxxxx616;
      expv[39] = 52'hxxxxxxxxxx616;
      expv[40] = 52'hxxxxxxxxxx616;
      expv[41] = 52'hxxxxxxxxxx616;
      expv[42] = 52'hxxxxxxxxxx5d6;
      expv[43] = 52'hxxxxxxxxxx5d6;
      expv[44] = 52'hxxxxxxxxxx5d8;
      expv[45] = 52'hxxxxxxxxxx698;
      expv[46] = 52'hxxxxxxxxxx658;
      expv[47] = 52'hxxxxxxxxxx61b;
      expv[48] = 52'hxxxxxxxxxx59b;
      expv[49] = 52'hxxxxxxxxxx55b;
      expv[50] = 52'hxxxxxxxxxx51b;
      expv[51] = 52'hxxxxxxxxxx512;
      expv[52] = 52'hxxxxxxxxxx5d2;
      expv[53] = 52'hxxxxxxxxxx5d2;
      expv[54] = 52'hxxxxxxxxxx612;
      expv[55] = 52'hxxxxxxxxxx612;
      expv[56] = 52'hxxxxxxxxxx5d2;
      expv[57] = 52'hxxxxxxxxxx5d8;
      expv[58] = 52'hxxxxxxxxxx5d8;
      expv[59] = 52'hxxxxxxxxxx5d8;
      expv[60] = 52'hxxxxxxxxxx5d8;
      expv[61] = 52'hxxxxxxxxxx59a;
      expv[62] = 52'hxxxxxxxxxx49a;
      expv[63] = 52'hxxxxxxxxxx458;
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
