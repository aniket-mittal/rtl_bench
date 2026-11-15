// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142213 dut (
    .in(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h02;
    stim[1] = 8'h46;
    stim[2] = 8'h50;
    stim[3] = 8'h6d;
    stim[4] = 8'he3;
    stim[5] = 8'h78;
    stim[6] = 8'h58;
    stim[7] = 8'hfe;
    stim[8] = 8'h4a;
    stim[9] = 8'hd5;
    stim[10] = 8'hb7;
    stim[11] = 8'h7e;
    stim[12] = 8'h62;
    stim[13] = 8'h1e;
    stim[14] = 8'h55;
    stim[15] = 8'h65;
    stim[16] = 8'h7d;
    stim[17] = 8'h22;
    stim[18] = 8'hb2;
    stim[19] = 8'h1e;
    stim[20] = 8'hbc;
    stim[21] = 8'ha7;
    stim[22] = 8'h39;
    stim[23] = 8'h7a;
    stim[24] = 8'h71;
    stim[25] = 8'h75;
    stim[26] = 8'hf2;
    stim[27] = 8'hda;
    stim[28] = 8'h59;
    stim[29] = 8'he2;
    stim[30] = 8'hf3;
    stim[31] = 8'h49;
    stim[32] = 8'hbf;
    stim[33] = 8'h22;
    stim[34] = 8'h21;
    stim[35] = 8'h81;
    stim[36] = 8'haa;
    stim[37] = 8'hfe;
    stim[38] = 8'h7e;
    stim[39] = 8'h49;
    stim[40] = 8'h28;
    stim[41] = 8'hf1;
    stim[42] = 8'h65;
    stim[43] = 8'h9c;
    stim[44] = 8'h89;
    stim[45] = 8'hdf;
    stim[46] = 8'h5b;
    stim[47] = 8'heb;
    stim[48] = 8'hea;
    stim[49] = 8'h00;
    stim[50] = 8'hda;
    stim[51] = 8'hb3;
    stim[52] = 8'hb3;
    stim[53] = 8'h15;
    stim[54] = 8'ha7;
    stim[55] = 8'h52;
    stim[56] = 8'h5f;
    stim[57] = 8'hfa;
    stim[58] = 8'hce;
    stim[59] = 8'h47;
    stim[60] = 8'h96;
    stim[61] = 8'h4b;
    stim[62] = 8'hf3;
    stim[63] = 8'h03;
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
      expv[0] = 8'h40;
      expv[1] = 8'h62;
      expv[2] = 8'h0a;
      expv[3] = 8'hb6;
      expv[4] = 8'hc7;
      expv[5] = 8'h1e;
      expv[6] = 8'h1a;
      expv[7] = 8'h7f;
      expv[8] = 8'h52;
      expv[9] = 8'hab;
      expv[10] = 8'hed;
      expv[11] = 8'h7e;
      expv[12] = 8'h46;
      expv[13] = 8'h78;
      expv[14] = 8'haa;
      expv[15] = 8'ha6;
      expv[16] = 8'hbe;
      expv[17] = 8'h44;
      expv[18] = 8'h4d;
      expv[19] = 8'h78;
      expv[20] = 8'h3d;
      expv[21] = 8'he5;
      expv[22] = 8'h9c;
      expv[23] = 8'h5e;
      expv[24] = 8'h8e;
      expv[25] = 8'hae;
      expv[26] = 8'h4f;
      expv[27] = 8'h5b;
      expv[28] = 8'h9a;
      expv[29] = 8'h47;
      expv[30] = 8'hcf;
      expv[31] = 8'h92;
      expv[32] = 8'hfd;
      expv[33] = 8'h44;
      expv[34] = 8'h84;
      expv[35] = 8'h81;
      expv[36] = 8'h55;
      expv[37] = 8'h7f;
      expv[38] = 8'h7e;
      expv[39] = 8'h92;
      expv[40] = 8'h14;
      expv[41] = 8'h8f;
      expv[42] = 8'ha6;
      expv[43] = 8'h39;
      expv[44] = 8'h91;
      expv[45] = 8'hfb;
      expv[46] = 8'hda;
      expv[47] = 8'hd7;
      expv[48] = 8'h57;
      expv[49] = 8'h00;
      expv[50] = 8'h5b;
      expv[51] = 8'hcd;
      expv[52] = 8'hcd;
      expv[53] = 8'ha8;
      expv[54] = 8'he5;
      expv[55] = 8'h4a;
      expv[56] = 8'hfa;
      expv[57] = 8'h5f;
      expv[58] = 8'h73;
      expv[59] = 8'he2;
      expv[60] = 8'h69;
      expv[61] = 8'hd2;
      expv[62] = 8'hcf;
      expv[63] = 8'hc0;
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
