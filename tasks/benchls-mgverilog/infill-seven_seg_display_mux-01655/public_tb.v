// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01655 dut (
    .CLKOUTseg(clk),
    .centenas(in_vec[14:11]),
    .decenas(in_vec[10:7]),
    .unidades(in_vec[6:3]),
    .C(in_vec[2:2]),
    .De(in_vec[1:1]),
    .U(in_vec[0:0]),
    .mostrar(out_vec[5:4]),
    .digito(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h798a;
    stim[1] = 15'h77fd;
    stim[2] = 15'h5683;
    stim[3] = 15'h5920;
    stim[4] = 15'h2a8c;
    stim[5] = 15'h7bfe;
    stim[6] = 15'h3c2d;
    stim[7] = 15'h7a17;
    stim[8] = 15'h2c9d;
    stim[9] = 15'h15ae;
    stim[10] = 15'h059b;
    stim[11] = 15'h1319;
    stim[12] = 15'h224a;
    stim[13] = 15'h3b6d;
    stim[14] = 15'h7fc1;
    stim[15] = 15'h1f77;
    stim[16] = 15'h2952;
    stim[17] = 15'h3e2d;
    stim[18] = 15'h20f3;
    stim[19] = 15'h5d6b;
    stim[20] = 15'h17cf;
    stim[21] = 15'h54e7;
    stim[22] = 15'h6d32;
    stim[23] = 15'h4403;
    stim[24] = 15'h0673;
    stim[25] = 15'h508b;
    stim[26] = 15'h53c9;
    stim[27] = 15'h3381;
    stim[28] = 15'h0362;
    stim[29] = 15'h6786;
    stim[30] = 15'h0317;
    stim[31] = 15'h27bb;
    stim[32] = 15'h7433;
    stim[33] = 15'h46aa;
    stim[34] = 15'h46e5;
    stim[35] = 15'h0432;
    stim[36] = 15'h544d;
    stim[37] = 15'h58ee;
    stim[38] = 15'h2d2e;
    stim[39] = 15'h0444;
    stim[40] = 15'h40bd;
    stim[41] = 15'h557c;
    stim[42] = 15'h440a;
    stim[43] = 15'h3543;
    stim[44] = 15'h344b;
    stim[45] = 15'h5172;
    stim[46] = 15'h743f;
    stim[47] = 15'h0fab;
    stim[48] = 15'h2238;
    stim[49] = 15'h68e3;
    stim[50] = 15'h4159;
    stim[51] = 15'h572e;
    stim[52] = 15'h6389;
    stim[53] = 15'h23bb;
    stim[54] = 15'h3b17;
    stim[55] = 15'h6bcc;
    stim[56] = 15'h3624;
    stim[57] = 15'h6377;
    stim[58] = 15'h71e9;
    stim[59] = 15'h2cde;
    stim[60] = 15'h595f;
    stim[61] = 15'h21c7;
    stim[62] = 15'h7c4a;
    stim[63] = 15'h785c;
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
      expv[0] = 6'hxx;
      expv[1] = 6'h10;
      expv[2] = 6'h10;
      expv[3] = 6'h10;
      expv[4] = 6'h22;
      expv[5] = 6'h10;
      expv[6] = 6'h10;
      expv[7] = 6'h10;
      expv[8] = 6'h12;
      expv[9] = 6'h29;
      expv[10] = 6'h15;
      expv[11] = 6'h10;
      expv[12] = 6'h13;
      expv[13] = 6'h19;
      expv[14] = 6'h10;
      expv[15] = 6'h18;
      expv[16] = 6'h1e;
      expv[17] = 6'h22;
      expv[18] = 6'h10;
      expv[19] = 6'h1e;
      expv[20] = 6'h2a;
      expv[21] = 6'h32;
      expv[22] = 6'h10;
      expv[23] = 6'h16;
      expv[24] = 6'h10;
      expv[25] = 6'h1e;
      expv[26] = 6'h21;
      expv[27] = 6'h3a;
      expv[28] = 6'h10;
      expv[29] = 6'h1c;
      expv[30] = 6'h10;
      expv[31] = 6'h10;
      expv[32] = 6'h17;
      expv[33] = 6'h28;
      expv[34] = 6'h38;
      expv[35] = 6'h10;
      expv[36] = 6'h16;
      expv[37] = 6'h10;
      expv[38] = 6'h1d;
      expv[39] = 6'h10;
      expv[40] = 6'h10;
      expv[41] = 6'h10;
      expv[42] = 6'h1f;
      expv[43] = 6'h10;
      expv[44] = 6'h10;
      expv[45] = 6'h19;
      expv[46] = 6'h22;
      expv[47] = 6'h10;
      expv[48] = 6'h15;
      expv[49] = 6'h24;
      expv[50] = 6'h10;
      expv[51] = 6'h1b;
      expv[52] = 6'h15;
      expv[53] = 6'h10;
      expv[54] = 6'h17;
      expv[55] = 6'h26;
      expv[56] = 6'h3d;
      expv[57] = 6'h10;
      expv[58] = 6'h10;
      expv[59] = 6'h1d;
      expv[60] = 6'h1b;
      expv[61] = 6'h10;
      expv[62] = 6'h18;
      expv[63] = 6'h28;
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
