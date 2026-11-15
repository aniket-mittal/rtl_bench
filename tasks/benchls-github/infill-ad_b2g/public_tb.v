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

  ad_b2g dut (
    .din(in_vec[7:0]),
    .dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h84;
    stim[1] = 8'h68;
    stim[2] = 8'hf3;
    stim[3] = 8'h9b;
    stim[4] = 8'hfe;
    stim[5] = 8'hc6;
    stim[6] = 8'h9a;
    stim[7] = 8'h5e;
    stim[8] = 8'hed;
    stim[9] = 8'h43;
    stim[10] = 8'h00;
    stim[11] = 8'h9f;
    stim[12] = 8'hba;
    stim[13] = 8'h41;
    stim[14] = 8'hde;
    stim[15] = 8'h19;
    stim[16] = 8'hbd;
    stim[17] = 8'hf8;
    stim[18] = 8'h2b;
    stim[19] = 8'h23;
    stim[20] = 8'h21;
    stim[21] = 8'h6c;
    stim[22] = 8'hd6;
    stim[23] = 8'hae;
    stim[24] = 8'h34;
    stim[25] = 8'h4f;
    stim[26] = 8'hd4;
    stim[27] = 8'hd4;
    stim[28] = 8'ha0;
    stim[29] = 8'h80;
    stim[30] = 8'h16;
    stim[31] = 8'h07;
    stim[32] = 8'h3a;
    stim[33] = 8'h8f;
    stim[34] = 8'hab;
    stim[35] = 8'h50;
    stim[36] = 8'ha7;
    stim[37] = 8'h91;
    stim[38] = 8'h65;
    stim[39] = 8'h89;
    stim[40] = 8'he3;
    stim[41] = 8'h1f;
    stim[42] = 8'hea;
    stim[43] = 8'he7;
    stim[44] = 8'h4a;
    stim[45] = 8'h4a;
    stim[46] = 8'h8e;
    stim[47] = 8'h38;
    stim[48] = 8'h43;
    stim[49] = 8'h81;
    stim[50] = 8'h08;
    stim[51] = 8'hdb;
    stim[52] = 8'h2f;
    stim[53] = 8'hcd;
    stim[54] = 8'he4;
    stim[55] = 8'h85;
    stim[56] = 8'h0a;
    stim[57] = 8'hf8;
    stim[58] = 8'ha7;
    stim[59] = 8'h1b;
    stim[60] = 8'h65;
    stim[61] = 8'h0b;
    stim[62] = 8'h64;
    stim[63] = 8'h38;
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
      expv[0] = 8'hc6;
      expv[1] = 8'h5c;
      expv[2] = 8'h8a;
      expv[3] = 8'hd6;
      expv[4] = 8'h81;
      expv[5] = 8'ha5;
      expv[6] = 8'hd7;
      expv[7] = 8'h71;
      expv[8] = 8'h9b;
      expv[9] = 8'h62;
      expv[10] = 8'h00;
      expv[11] = 8'hd0;
      expv[12] = 8'he7;
      expv[13] = 8'h61;
      expv[14] = 8'hb1;
      expv[15] = 8'h15;
      expv[16] = 8'he3;
      expv[17] = 8'h84;
      expv[18] = 8'h3e;
      expv[19] = 8'h32;
      expv[20] = 8'h31;
      expv[21] = 8'h5a;
      expv[22] = 8'hbd;
      expv[23] = 8'hf9;
      expv[24] = 8'h2e;
      expv[25] = 8'h68;
      expv[26] = 8'hbe;
      expv[27] = 8'hbe;
      expv[28] = 8'hf0;
      expv[29] = 8'hc0;
      expv[30] = 8'h1d;
      expv[31] = 8'h04;
      expv[32] = 8'h27;
      expv[33] = 8'hc8;
      expv[34] = 8'hfe;
      expv[35] = 8'h78;
      expv[36] = 8'hf4;
      expv[37] = 8'hd9;
      expv[38] = 8'h57;
      expv[39] = 8'hcd;
      expv[40] = 8'h92;
      expv[41] = 8'h10;
      expv[42] = 8'h9f;
      expv[43] = 8'h94;
      expv[44] = 8'h6f;
      expv[45] = 8'h6f;
      expv[46] = 8'hc9;
      expv[47] = 8'h24;
      expv[48] = 8'h62;
      expv[49] = 8'hc1;
      expv[50] = 8'h0c;
      expv[51] = 8'hb6;
      expv[52] = 8'h38;
      expv[53] = 8'hab;
      expv[54] = 8'h96;
      expv[55] = 8'hc7;
      expv[56] = 8'h0f;
      expv[57] = 8'h84;
      expv[58] = 8'hf4;
      expv[59] = 8'h16;
      expv[60] = 8'h57;
      expv[61] = 8'h0e;
      expv[62] = 8'h56;
      expv[63] = 8'h24;
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
