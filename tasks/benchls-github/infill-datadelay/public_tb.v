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

  DataDelay dut (
    .clk(clk),
    .in_data(in_vec[7:0]),
    .out_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h7e;
    stim[1] = 8'h07;
    stim[2] = 8'hdb;
    stim[3] = 8'h8d;
    stim[4] = 8'h69;
    stim[5] = 8'h19;
    stim[6] = 8'h24;
    stim[7] = 8'h95;
    stim[8] = 8'hb6;
    stim[9] = 8'h3c;
    stim[10] = 8'hf1;
    stim[11] = 8'h78;
    stim[12] = 8'h8e;
    stim[13] = 8'h2b;
    stim[14] = 8'hc6;
    stim[15] = 8'hd8;
    stim[16] = 8'h01;
    stim[17] = 8'hce;
    stim[18] = 8'h8d;
    stim[19] = 8'h5a;
    stim[20] = 8'h91;
    stim[21] = 8'h27;
    stim[22] = 8'hd5;
    stim[23] = 8'h6e;
    stim[24] = 8'h7b;
    stim[25] = 8'h46;
    stim[26] = 8'h41;
    stim[27] = 8'h46;
    stim[28] = 8'h3b;
    stim[29] = 8'h33;
    stim[30] = 8'h87;
    stim[31] = 8'h57;
    stim[32] = 8'hf4;
    stim[33] = 8'h5e;
    stim[34] = 8'ha9;
    stim[35] = 8'h38;
    stim[36] = 8'h08;
    stim[37] = 8'hf6;
    stim[38] = 8'h24;
    stim[39] = 8'hfc;
    stim[40] = 8'hc6;
    stim[41] = 8'hcf;
    stim[42] = 8'h6e;
    stim[43] = 8'hc9;
    stim[44] = 8'hc1;
    stim[45] = 8'h31;
    stim[46] = 8'h58;
    stim[47] = 8'hb2;
    stim[48] = 8'hc9;
    stim[49] = 8'haa;
    stim[50] = 8'hfe;
    stim[51] = 8'h64;
    stim[52] = 8'hf8;
    stim[53] = 8'h3d;
    stim[54] = 8'h4c;
    stim[55] = 8'h85;
    stim[56] = 8'hda;
    stim[57] = 8'hf8;
    stim[58] = 8'hb4;
    stim[59] = 8'h76;
    stim[60] = 8'h94;
    stim[61] = 8'hbe;
    stim[62] = 8'h58;
    stim[63] = 8'h6d;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h7e;
      expv[2] = 8'h07;
      expv[3] = 8'hdb;
      expv[4] = 8'h8d;
      expv[5] = 8'h69;
      expv[6] = 8'h19;
      expv[7] = 8'h24;
      expv[8] = 8'h95;
      expv[9] = 8'hb6;
      expv[10] = 8'h3c;
      expv[11] = 8'hf1;
      expv[12] = 8'h78;
      expv[13] = 8'h8e;
      expv[14] = 8'h2b;
      expv[15] = 8'hc6;
      expv[16] = 8'hd8;
      expv[17] = 8'h01;
      expv[18] = 8'hce;
      expv[19] = 8'h8d;
      expv[20] = 8'h5a;
      expv[21] = 8'h91;
      expv[22] = 8'h27;
      expv[23] = 8'hd5;
      expv[24] = 8'h6e;
      expv[25] = 8'h7b;
      expv[26] = 8'h46;
      expv[27] = 8'h41;
      expv[28] = 8'h46;
      expv[29] = 8'h3b;
      expv[30] = 8'h33;
      expv[31] = 8'h87;
      expv[32] = 8'h57;
      expv[33] = 8'hf4;
      expv[34] = 8'h5e;
      expv[35] = 8'ha9;
      expv[36] = 8'h38;
      expv[37] = 8'h08;
      expv[38] = 8'hf6;
      expv[39] = 8'h24;
      expv[40] = 8'hfc;
      expv[41] = 8'hc6;
      expv[42] = 8'hcf;
      expv[43] = 8'h6e;
      expv[44] = 8'hc9;
      expv[45] = 8'hc1;
      expv[46] = 8'h31;
      expv[47] = 8'h58;
      expv[48] = 8'hb2;
      expv[49] = 8'hc9;
      expv[50] = 8'haa;
      expv[51] = 8'hfe;
      expv[52] = 8'h64;
      expv[53] = 8'hf8;
      expv[54] = 8'h3d;
      expv[55] = 8'h4c;
      expv[56] = 8'h85;
      expv[57] = 8'hda;
      expv[58] = 8'hf8;
      expv[59] = 8'hb4;
      expv[60] = 8'h76;
      expv[61] = 8'h94;
      expv[62] = 8'hbe;
      expv[63] = 8'h58;
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
