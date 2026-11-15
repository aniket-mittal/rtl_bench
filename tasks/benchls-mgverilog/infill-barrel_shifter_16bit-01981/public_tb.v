// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01981 dut (
    .ain(in_vec[22:7]),
    .bin(in_vec[6:2]),
    .rotate(in_vec[1:1]),
    .sra(in_vec[0:0]),
    .yout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h687f76;
    stim[1] = 23'h6b6aca;
    stim[2] = 23'h62ac54;
    stim[3] = 23'h376900;
    stim[4] = 23'h041d83;
    stim[5] = 23'h2f692c;
    stim[6] = 23'h311ab1;
    stim[7] = 23'h13e589;
    stim[8] = 23'h7a3bc4;
    stim[9] = 23'h149a1c;
    stim[10] = 23'h0c37a3;
    stim[11] = 23'h4aa864;
    stim[12] = 23'h1d67be;
    stim[13] = 23'h0a654a;
    stim[14] = 23'h6f7f22;
    stim[15] = 23'h452b8a;
    stim[16] = 23'h5895e1;
    stim[17] = 23'h59f5f0;
    stim[18] = 23'h6f0b7a;
    stim[19] = 23'h254c7c;
    stim[20] = 23'h07d9ac;
    stim[21] = 23'h29a38e;
    stim[22] = 23'h51b173;
    stim[23] = 23'h6b6aec;
    stim[24] = 23'h0081e6;
    stim[25] = 23'h4f42fc;
    stim[26] = 23'h19476c;
    stim[27] = 23'h6422de;
    stim[28] = 23'h659df1;
    stim[29] = 23'h3874ac;
    stim[30] = 23'h4f6f61;
    stim[31] = 23'h6e20ab;
    stim[32] = 23'h047a4b;
    stim[33] = 23'h1982ad;
    stim[34] = 23'h78a4a2;
    stim[35] = 23'h32b795;
    stim[36] = 23'h77f17f;
    stim[37] = 23'h4a39ab;
    stim[38] = 23'h59fa27;
    stim[39] = 23'h52a58c;
    stim[40] = 23'h10917e;
    stim[41] = 23'h341791;
    stim[42] = 23'h597d18;
    stim[43] = 23'h0963b7;
    stim[44] = 23'h3b31e4;
    stim[45] = 23'h3ccda2;
    stim[46] = 23'h5f0456;
    stim[47] = 23'h4bb4ac;
    stim[48] = 23'h175e58;
    stim[49] = 23'h357673;
    stim[50] = 23'h1e5a43;
    stim[51] = 23'h0a162c;
    stim[52] = 23'h644e2f;
    stim[53] = 23'h6f22a8;
    stim[54] = 23'h75e13f;
    stim[55] = 23'h1ba15c;
    stim[56] = 23'h7ebaf6;
    stim[57] = 23'h3f8f5c;
    stim[58] = 23'h0bda3d;
    stim[59] = 23'h6ebcb8;
    stim[60] = 23'h50640b;
    stim[61] = 23'h349c00;
    stim[62] = 23'h1141fd;
    stim[63] = 23'h517561;
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
      expv[0] = 16'h87f6;
      expv[1] = 16'h75b5;
      expv[2] = 16'hc000;
      expv[3] = 16'h6ed2;
      expv[4] = 16'h083b;
      expv[5] = 16'h000b;
      expv[6] = 16'h0006;
      expv[7] = 16'h09f2;
      expv[8] = 16'h8000;
      expv[9] = 16'h0052;
      expv[10] = 16'h6f18;
      expv[11] = 16'ha800;
      expv[12] = 16'h759e;
      expv[13] = 16'h8532;
      expv[14] = 16'hfede;
      expv[15] = 16'he295;
      expv[16] = 16'h2b00;
      expv[17] = 16'h3eb0;
      expv[18] = 16'h785b;
      expv[19] = 16'h9530;
      expv[20] = 16'h0001;
      expv[21] = 16'hea68;
      expv[22] = 16'h362a;
      expv[23] = 16'hdaa0;
      expv[24] = 16'h8180;
      expv[25] = 16'h3d0a;
      expv[26] = 16'h51c0;
      expv[27] = 16'h8b90;
      expv[28] = 16'hb3b0;
      expv[29] = 16'h000e;
      expv[30] = 16'hde00;
      expv[31] = 16'h1077;
      expv[32] = 16'h023d;
      expv[33] = 16'h0006;
      expv[34] = 16'h49f1;
      expv[35] = 16'h032b;
      expv[36] = 16'hdfc5;
      expv[37] = 16'h1ce5;
      expv[38] = 16'hfa59;
      expv[39] = 16'h14a9;
      expv[40] = 16'h4244;
      expv[41] = 16'h0682;
      expv[42] = 16'h02cb;
      expv[43] = 16'h9638;
      expv[44] = 16'h3180;
      expv[45] = 16'h9b79;
      expv[46] = 16'h45f0;
      expv[47] = 16'h0012;
      expv[48] = 16'hf000;
      expv[49] = 16'haec6;
      expv[50] = 16'h3cb4;
      expv[51] = 16'h0002;
      expv[52] = 16'h1399;
      expv[53] = 16'h0037;
      expv[54] = 16'hd785;
      expv[55] = 16'h8400;
      expv[56] = 16'hebaf;
      expv[57] = 16'h3c00;
      expv[58] = 16'h0000;
      expv[59] = 16'h0003;
      expv[60] = 16'h2832;
      expv[61] = 16'h6938;
      expv[62] = 16'h4506;
      expv[63] = 16'hea00;
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
