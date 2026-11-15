// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01036 dut (
    .iMop(in_vec[7:0]),
    .oUopFlowIdx(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h57;
    stim[1] = 8'h87;
    stim[2] = 8'he5;
    stim[3] = 8'ha2;
    stim[4] = 8'hfe;
    stim[5] = 8'hbe;
    stim[6] = 8'h38;
    stim[7] = 8'hf2;
    stim[8] = 8'h76;
    stim[9] = 8'hbc;
    stim[10] = 8'h66;
    stim[11] = 8'h19;
    stim[12] = 8'ha7;
    stim[13] = 8'h9b;
    stim[14] = 8'ha9;
    stim[15] = 8'h78;
    stim[16] = 8'ha6;
    stim[17] = 8'hed;
    stim[18] = 8'h7b;
    stim[19] = 8'hdf;
    stim[20] = 8'hbc;
    stim[21] = 8'hd5;
    stim[22] = 8'h77;
    stim[23] = 8'h1e;
    stim[24] = 8'hd3;
    stim[25] = 8'h61;
    stim[26] = 8'h7b;
    stim[27] = 8'hc0;
    stim[28] = 8'h48;
    stim[29] = 8'h50;
    stim[30] = 8'hf7;
    stim[31] = 8'h53;
    stim[32] = 8'he8;
    stim[33] = 8'h45;
    stim[34] = 8'h91;
    stim[35] = 8'h66;
    stim[36] = 8'h9d;
    stim[37] = 8'h3f;
    stim[38] = 8'h56;
    stim[39] = 8'h11;
    stim[40] = 8'h8b;
    stim[41] = 8'h4a;
    stim[42] = 8'h72;
    stim[43] = 8'h2f;
    stim[44] = 8'hbb;
    stim[45] = 8'hda;
    stim[46] = 8'h44;
    stim[47] = 8'h2f;
    stim[48] = 8'hba;
    stim[49] = 8'hb6;
    stim[50] = 8'hda;
    stim[51] = 8'hab;
    stim[52] = 8'he4;
    stim[53] = 8'he0;
    stim[54] = 8'h14;
    stim[55] = 8'he2;
    stim[56] = 8'h84;
    stim[57] = 8'h97;
    stim[58] = 8'h0d;
    stim[59] = 8'hc9;
    stim[60] = 8'h15;
    stim[61] = 8'h85;
    stim[62] = 8'h00;
    stim[63] = 8'hf7;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h1dd;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h045;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
