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

  mg_03157 dut (
    .pgmaddr(in_vec[7:0]),
    .pgmdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h73;
    stim[1] = 8'h00;
    stim[2] = 8'h56;
    stim[3] = 8'h89;
    stim[4] = 8'hff;
    stim[5] = 8'hd6;
    stim[6] = 8'hf0;
    stim[7] = 8'h64;
    stim[8] = 8'h21;
    stim[9] = 8'he3;
    stim[10] = 8'ha5;
    stim[11] = 8'hda;
    stim[12] = 8'hd2;
    stim[13] = 8'h38;
    stim[14] = 8'h3a;
    stim[15] = 8'h18;
    stim[16] = 8'hc5;
    stim[17] = 8'h0b;
    stim[18] = 8'hc7;
    stim[19] = 8'hf6;
    stim[20] = 8'hf2;
    stim[21] = 8'h3b;
    stim[22] = 8'h67;
    stim[23] = 8'h19;
    stim[24] = 8'hc1;
    stim[25] = 8'h79;
    stim[26] = 8'h75;
    stim[27] = 8'h74;
    stim[28] = 8'hde;
    stim[29] = 8'h13;
    stim[30] = 8'h11;
    stim[31] = 8'hbf;
    stim[32] = 8'hc9;
    stim[33] = 8'he8;
    stim[34] = 8'h04;
    stim[35] = 8'h49;
    stim[36] = 8'hff;
    stim[37] = 8'hc7;
    stim[38] = 8'hb4;
    stim[39] = 8'h17;
    stim[40] = 8'h8e;
    stim[41] = 8'h4c;
    stim[42] = 8'hfc;
    stim[43] = 8'he3;
    stim[44] = 8'h43;
    stim[45] = 8'h57;
    stim[46] = 8'ha5;
    stim[47] = 8'h31;
    stim[48] = 8'h4a;
    stim[49] = 8'h61;
    stim[50] = 8'h82;
    stim[51] = 8'ha5;
    stim[52] = 8'hbf;
    stim[53] = 8'hb0;
    stim[54] = 8'h9f;
    stim[55] = 8'h63;
    stim[56] = 8'h6b;
    stim[57] = 8'h2e;
    stim[58] = 8'h6f;
    stim[59] = 8'h29;
    stim[60] = 8'h37;
    stim[61] = 8'h61;
    stim[62] = 8'hee;
    stim[63] = 8'he2;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h82;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'h83;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
