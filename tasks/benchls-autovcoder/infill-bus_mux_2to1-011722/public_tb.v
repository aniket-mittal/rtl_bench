// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011722 dut (
    .bus_clock(clk),
    .bus_port0_valid_i(in_vec[65:65]),
    .bus_port0_data_i(in_vec[64:33]),
    .bus_port1_valid_i(in_vec[32:32]),
    .bus_port1_data_i(in_vec[31:0]),
    .bus_valid_o(out_vec[32:32]),
    .bus_data_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h1d60e8727f00507b8;
    stim[1] = 66'h197ba177a9c5fdac0;
    stim[2] = 66'h32a2d327868982246;
    stim[3] = 66'h1358bc4444ef94280;
    stim[4] = 66'h2c1273ed8718fb6a4;
    stim[5] = 66'h38ecd8887cb8fbaf5;
    stim[6] = 66'h0aa591931d0a23bca;
    stim[7] = 66'h01128578437746e15;
    stim[8] = 66'h2aefd90ebd5cc42b9;
    stim[9] = 66'h21f12ffe209ffce35;
    stim[10] = 66'h2ef66eb391d4f908a;
    stim[11] = 66'h2eb1ff896356c688a;
    stim[12] = 66'h3c817db6cbbf944a0;
    stim[13] = 66'h18ae71dc00fea57dc;
    stim[14] = 66'h035007d4fba886631;
    stim[15] = 66'h0fae13ba1e7cdb30c;
    stim[16] = 66'h293cc30fa3982f3a9;
    stim[17] = 66'h2148da4492897852b;
    stim[18] = 66'h244df255e1ebf395b;
    stim[19] = 66'h312e0179334a68537;
    stim[20] = 66'h016c9a9620d496c29;
    stim[21] = 66'h15cf96bcdeb6834be;
    stim[22] = 66'h10a20064f8e83d1f2;
    stim[23] = 66'h20bd9dd7c2d5d3e94;
    stim[24] = 66'h0ba2fc23d8b2f4e83;
    stim[25] = 66'h070cb72e32aaea5b6;
    stim[26] = 66'h313cb694dc72e2706;
    stim[27] = 66'h2d8ddb26e838a40f6;
    stim[28] = 66'h2ec9d020064ed0b00;
    stim[29] = 66'h3c1525afbef09bae7;
    stim[30] = 66'h352d1cd023841a8b7;
    stim[31] = 66'h25b711101b86790df;
    stim[32] = 66'h29952964cd381ed17;
    stim[33] = 66'h0a7b89f64e62fd857;
    stim[34] = 66'h21b376db84b3071e9;
    stim[35] = 66'h157c6c85d0decff16;
    stim[36] = 66'h13aad28b8e573eeb8;
    stim[37] = 66'h0e6ff5f51d0485711;
    stim[38] = 66'h06b95a40cdf5ea9f4;
    stim[39] = 66'h370949cd8b47935b4;
    stim[40] = 66'h2f35ea8910e87079c;
    stim[41] = 66'h360bdf570519ff3ae;
    stim[42] = 66'h33eef63550ab29933;
    stim[43] = 66'h057949d77db8443b9;
    stim[44] = 66'h067fdba2cdf197cdc;
    stim[45] = 66'h1b938c1314331181a;
    stim[46] = 66'h0145d0f791026d062;
    stim[47] = 66'h088c4baeba84edfe3;
    stim[48] = 66'h0a36cfaa2d30f763c;
    stim[49] = 66'h37d57e3b0b539c266;
    stim[50] = 66'h191085d4b23bc32b2;
    stim[51] = 66'h046b6490661aa7ae3;
    stim[52] = 66'h28d9a7917b7e10f84;
    stim[53] = 66'h23eaaad3efca080b2;
    stim[54] = 66'h02a7909e39ab91c81;
    stim[55] = 66'h0a6409b4007681048;
    stim[56] = 66'h1ba6bbba8b8b55c10;
    stim[57] = 66'h22bebadd6618890ae;
    stim[58] = 66'h0a38171eee65746b4;
    stim[59] = 66'h1f5e9d10b29606fff;
    stim[60] = 66'h12c8272c89e1b4aa0;
    stim[61] = 66'h2a35899f5b595232e;
    stim[62] = 66'h1c0f818b243f370b5;
    stim[63] = 66'h010259ebc99b5ea61;
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
      expv[0] = 33'h1f00507b8;
      expv[1] = 33'h000000000;
      expv[2] = 33'h19516993c;
      expv[3] = 33'h000000000;
      expv[4] = 33'h160939f6c;
      expv[5] = 33'h1c766c443;
      expv[6] = 33'h1d0a23bca;
      expv[7] = 33'h000000000;
      expv[8] = 33'h1577ec875;
      expv[9] = 33'h10f897ff1;
      expv[10] = 33'h177b3759c;
      expv[11] = 33'h1758ffc4b;
      expv[12] = 33'h1e40bedb6;
      expv[13] = 33'h000000000;
      expv[14] = 33'h1ba886631;
      expv[15] = 33'h1e7cdb30c;
      expv[16] = 33'h149e6187d;
      expv[17] = 33'h10a46d224;
      expv[18] = 33'h1226f92af;
      expv[19] = 33'h189700bc9;
      expv[20] = 33'h000000000;
      expv[21] = 33'h1eb6834be;
      expv[22] = 33'h18e83d1f2;
      expv[23] = 33'h105eceebe;
      expv[24] = 33'h18b2f4e83;
      expv[25] = 33'h12aaea5b6;
      expv[26] = 33'h189e5b4a6;
      expv[27] = 33'h16c6ed937;
      expv[28] = 33'h1764e8100;
      expv[29] = 33'h1e0a92d7d;
      expv[30] = 33'h1a968e681;
      expv[31] = 33'h12db88880;
      expv[32] = 33'h14ca94b26;
      expv[33] = 33'h000000000;
      expv[34] = 33'h10d9bb6dc;
      expv[35] = 33'h10decff16;
      expv[36] = 33'h000000000;
      expv[37] = 33'h1d0485711;
      expv[38] = 33'h000000000;
      expv[39] = 33'h1b84a4e6c;
      expv[40] = 33'h179af5448;
      expv[41] = 33'h1b05efab8;
      expv[42] = 33'h19f77b1aa;
      expv[43] = 33'h1db8443b9;
      expv[44] = 33'h000000000;
      expv[45] = 33'h14331181a;
      expv[46] = 33'h11026d062;
      expv[47] = 33'h1a84edfe3;
      expv[48] = 33'h000000000;
      expv[49] = 33'h1beabf1d8;
      expv[50] = 33'h123bc32b2;
      expv[51] = 33'h000000000;
      expv[52] = 33'h146cd3c8b;
      expv[53] = 33'h11f55569f;
      expv[54] = 33'h19ab91c81;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h115f5d6eb;
      expv[58] = 33'h000000000;
      expv[59] = 33'h129606fff;
      expv[60] = 33'h000000000;
      expv[61] = 33'h151ac4cfa;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
