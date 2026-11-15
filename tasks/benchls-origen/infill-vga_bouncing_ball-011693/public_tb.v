// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011693 dut (
    .pixel_clock(clk),
    .rst(in_vec[23:23]),
    .sw0(in_vec[22:22]),
    .sw1(in_vec[21:21]),
    .hPos(in_vec[20:11]),
    .vPos(in_vec[10:1]),
    .videoOn(in_vec[0:0]),
    .R(out_vec[15:11]),
    .G(out_vec[10:5]),
    .B(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hcc6300;
    stim[1] = 24'hef03b1;
    stim[2] = 24'h480d46;
    stim[3] = 24'h6fb8a2;
    stim[4] = 24'h526f8d;
    stim[5] = 24'h265711;
    stim[6] = 24'h483498;
    stim[7] = 24'h3915d6;
    stim[8] = 24'h11e359;
    stim[9] = 24'h1be0a9;
    stim[10] = 24'h1f4113;
    stim[11] = 24'h3f0cfd;
    stim[12] = 24'h109fd4;
    stim[13] = 24'h2b73f3;
    stim[14] = 24'h561b93;
    stim[15] = 24'h4ad794;
    stim[16] = 24'h0dcc84;
    stim[17] = 24'h6401e8;
    stim[18] = 24'h5ca7c4;
    stim[19] = 24'h4e662c;
    stim[20] = 24'h0197f7;
    stim[21] = 24'h6875c6;
    stim[22] = 24'h1c0173;
    stim[23] = 24'h62c4d5;
    stim[24] = 24'h52f376;
    stim[25] = 24'h5640ae;
    stim[26] = 24'h122b22;
    stim[27] = 24'h3f9c3d;
    stim[28] = 24'h7693ae;
    stim[29] = 24'h636d96;
    stim[30] = 24'h66d875;
    stim[31] = 24'h066971;
    stim[32] = 24'h1c2d17;
    stim[33] = 24'h7c2306;
    stim[34] = 24'h3842c4;
    stim[35] = 24'h4febe2;
    stim[36] = 24'h3a4796;
    stim[37] = 24'h292c71;
    stim[38] = 24'h3482da;
    stim[39] = 24'h4f0a79;
    stim[40] = 24'h3dd4e3;
    stim[41] = 24'h052b9c;
    stim[42] = 24'h3ec1c0;
    stim[43] = 24'h0cf86e;
    stim[44] = 24'h4412b8;
    stim[45] = 24'h6c8e3d;
    stim[46] = 24'h114231;
    stim[47] = 24'h64435e;
    stim[48] = 24'h56494a;
    stim[49] = 24'h3f0d12;
    stim[50] = 24'h6ef663;
    stim[51] = 24'h310211;
    stim[52] = 24'h3923c2;
    stim[53] = 24'h238698;
    stim[54] = 24'ha2dcd6;
    stim[55] = 24'h4613b8;
    stim[56] = 24'h56c44f;
    stim[57] = 24'h40527f;
    stim[58] = 24'h4d213a;
    stim[59] = 24'h617bcd;
    stim[60] = 24'h742de2;
    stim[61] = 24'h1d668f;
    stim[62] = 24'h77253c;
    stim[63] = 24'h33ae3e;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'hffff;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'hffff;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'hffff;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'hffff;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'hffff;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'hffff;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'hffff;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'hffff;
      expv[57] = 16'hffff;
      expv[58] = 16'h0000;
      expv[59] = 16'hffff;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
