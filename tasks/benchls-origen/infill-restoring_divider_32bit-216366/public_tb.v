// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_216366 dut (
    .clock(clk),
    .dividend(in_vec[65:34]),
    .divisor(in_vec[33:2]),
    .start(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .q(out_vec[64:33]),
    .r(out_vec[32:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h08b3ac77bc3529d4d;
    stim[1] = 66'h18913557ef799b313;
    stim[2] = 66'h3d39b215f0a12e674;
    stim[3] = 66'h2c3276d2a8ab1ae62;
    stim[4] = 66'h156e0d4a592cb464e;
    stim[5] = 66'h0585dee2ffc8c5bb8;
    stim[6] = 66'h3310efa26901bdbce;
    stim[7] = 66'h190d2d015c7e05b80;
    stim[8] = 66'h18ed73307a02db7f4;
    stim[9] = 66'h0cb9fa34a67d75364;
    stim[10] = 66'h3c0dc7e5b97a6f53c;
    stim[11] = 66'h37a28fc753a796fc2;
    stim[12] = 66'h3d54f265c4c1eeeb6;
    stim[13] = 66'h343391691f8f3ee12;
    stim[14] = 66'h081e6e99482cab4d8;
    stim[15] = 66'h3a69bf3a1ee190664;
    stim[16] = 66'h2a05a7a80b040c22e;
    stim[17] = 66'h21a58bd8e4376bea8;
    stim[18] = 66'h2483eb9e1b9c0c846;
    stim[19] = 66'h2c293603ccd25e430;
    stim[20] = 66'h290aa6bf741da5698;
    stim[21] = 66'h37b6df36d8dceea1c;
    stim[22] = 66'h3b63776c0740ad0f2;
    stim[23] = 66'h054adcb48797b6ab4;
    stim[24] = 66'h35a9c8f3462f6129c;
    stim[25] = 66'h3d28dd369b0dad018;
    stim[26] = 66'h13acef7653627e316;
    stim[27] = 66'h10e168745d3ee94aa;
    stim[28] = 66'h15f1068b924730d6e;
    stim[29] = 66'h1c3715a33e8fa8538;
    stim[30] = 66'h273b424a29523555c;
    stim[31] = 66'h200e74ba0286bfcd8;
    stim[32] = 66'h077ec431815322194;
    stim[33] = 66'h0d4660c8fc3a6eaca;
    stim[34] = 66'h34cddccab281fb74e;
    stim[35] = 66'h3ff3ef1f6d0f609f0;
    stim[36] = 66'h1b8df701dde8615fa;
    stim[37] = 66'h0513caf174616505a;
    stim[38] = 66'h05fa24cb92d37a2c4;
    stim[39] = 66'h0ecd8ef91e7f2b7b8;
    stim[40] = 66'h051eacba291e70a92;
    stim[41] = 66'h0acbdf81dd9428a56;
    stim[42] = 66'h33c09664581401f98;
    stim[43] = 66'h235e04e7ee3a4c42e;
    stim[44] = 66'h1d9c936e884dc0818;
    stim[45] = 66'h0ea4ee3ccb825a3ee;
    stim[46] = 66'h32aa5cda487bd4c5b;
    stim[47] = 66'h03933d1c9e851c92c;
    stim[48] = 66'h26de44bf8cb42ef06;
    stim[49] = 66'h01175503ba20e1dce;
    stim[50] = 66'h29f534c3d6e61505a;
    stim[51] = 66'h1748f61de0f2c088c;
    stim[52] = 66'h004b44026ff7b6dc0;
    stim[53] = 66'h1c65ebf2492c37b8a;
    stim[54] = 66'h1ee2e049a4e7f7620;
    stim[55] = 66'h24b939eb207ca12b8;
    stim[56] = 66'h311b08e1e2c3cd7fc;
    stim[57] = 66'h27cf14bc9d9407a8a;
    stim[58] = 66'h05c4d1435a9226678;
    stim[59] = 66'h35c490e1093910af9;
    stim[60] = 66'h2456fb7155a00118c;
    stim[61] = 66'h07414a06105490752;
    stim[62] = 66'h2a664e4c1452aa467;
    stim[63] = 66'h3f532d1c61dab2cea;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000001;
      expv[5] = 65'h00000000000000001;
      expv[6] = 65'h00000000000000001;
      expv[7] = 65'h00000000000000001;
      expv[8] = 65'h00000000000000001;
      expv[9] = 65'h00000000000000001;
      expv[10] = 65'h00000000000000001;
      expv[11] = 65'h00000000000000001;
      expv[12] = 65'h00000000000000001;
      expv[13] = 65'h00000000000000001;
      expv[14] = 65'h00000000000000001;
      expv[15] = 65'h00000000000000001;
      expv[16] = 65'h00000000000000001;
      expv[17] = 65'h00000000000000001;
      expv[18] = 65'h00000000000000001;
      expv[19] = 65'h00000000000000001;
      expv[20] = 65'h00000000000000001;
      expv[21] = 65'h00000000000000001;
      expv[22] = 65'h00000000000000001;
      expv[23] = 65'h00000000000000001;
      expv[24] = 65'h00000000000000001;
      expv[25] = 65'h00000000000000001;
      expv[26] = 65'h00000000000000001;
      expv[27] = 65'h00000000000000001;
      expv[28] = 65'h00000000000000001;
      expv[29] = 65'h00000000000000001;
      expv[30] = 65'h00000000000000001;
      expv[31] = 65'h00000000000000001;
      expv[32] = 65'h00000000000000001;
      expv[33] = 65'h00000000000000001;
      expv[34] = 65'h00000000000000001;
      expv[35] = 65'h00000000000000001;
      expv[36] = 65'h00000000000000001;
      expv[37] = 65'h00000000000000001;
      expv[38] = 65'h00000000000000001;
      expv[39] = 65'h00000000000000001;
      expv[40] = 65'h00000000000000001;
      expv[41] = 65'h00000000000000001;
      expv[42] = 65'h00000000000000001;
      expv[43] = 65'h00000000000000001;
      expv[44] = 65'h00000000000000001;
      expv[45] = 65'h00000000000000001;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000001;
      expv[50] = 65'h00000000000000001;
      expv[51] = 65'h00000000000000001;
      expv[52] = 65'h00000000000000001;
      expv[53] = 65'h00000000000000001;
      expv[54] = 65'h00000000000000001;
      expv[55] = 65'h00000000000000001;
      expv[56] = 65'h00000000000000001;
      expv[57] = 65'h00000000000000001;
      expv[58] = 65'h00000000000000001;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
