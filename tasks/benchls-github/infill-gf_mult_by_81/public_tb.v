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

  gf_mult_by_81 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hca;
    stim[1] = 8'hdc;
    stim[2] = 8'hc7;
    stim[3] = 8'hf7;
    stim[4] = 8'he2;
    stim[5] = 8'hd7;
    stim[6] = 8'hab;
    stim[7] = 8'h5c;
    stim[8] = 8'hd3;
    stim[9] = 8'h17;
    stim[10] = 8'h35;
    stim[11] = 8'hde;
    stim[12] = 8'h94;
    stim[13] = 8'h18;
    stim[14] = 8'hb3;
    stim[15] = 8'haf;
    stim[16] = 8'ha5;
    stim[17] = 8'he5;
    stim[18] = 8'h01;
    stim[19] = 8'h68;
    stim[20] = 8'hde;
    stim[21] = 8'h3c;
    stim[22] = 8'h56;
    stim[23] = 8'h31;
    stim[24] = 8'hca;
    stim[25] = 8'he8;
    stim[26] = 8'ha7;
    stim[27] = 8'h3d;
    stim[28] = 8'he0;
    stim[29] = 8'hbc;
    stim[30] = 8'h3e;
    stim[31] = 8'h6e;
    stim[32] = 8'h50;
    stim[33] = 8'h07;
    stim[34] = 8'h39;
    stim[35] = 8'hc4;
    stim[36] = 8'h00;
    stim[37] = 8'h39;
    stim[38] = 8'h23;
    stim[39] = 8'h66;
    stim[40] = 8'h86;
    stim[41] = 8'heb;
    stim[42] = 8'ha9;
    stim[43] = 8'h6c;
    stim[44] = 8'h42;
    stim[45] = 8'ha5;
    stim[46] = 8'hb1;
    stim[47] = 8'ha2;
    stim[48] = 8'hed;
    stim[49] = 8'hf6;
    stim[50] = 8'hc7;
    stim[51] = 8'h51;
    stim[52] = 8'h9c;
    stim[53] = 8'h84;
    stim[54] = 8'h93;
    stim[55] = 8'h49;
    stim[56] = 8'he9;
    stim[57] = 8'h56;
    stim[58] = 8'h13;
    stim[59] = 8'hb2;
    stim[60] = 8'ha8;
    stim[61] = 8'ha6;
    stim[62] = 8'h10;
    stim[63] = 8'ha1;
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
      expv[0] = 8'h37;
      expv[1] = 8'hee;
      expv[2] = 8'hf4;
      expv[3] = 8'he1;
      expv[4] = 8'ha6;
      expv[5] = 8'h0c;
      expv[6] = 8'h9c;
      expv[7] = 8'h7d;
      expv[8] = 8'h32;
      expv[9] = 8'h58;
      expv[10] = 8'haa;
      expv[11] = 8'hf1;
      expv[12] = 8'h55;
      expv[13] = 8'h84;
      expv[14] = 8'h18;
      expv[15] = 8'ha2;
      expv[16] = 8'hc1;
      expv[17] = 8'h06;
      expv[18] = 8'h81;
      expv[19] = 8'h56;
      expv[20] = 8'hf1;
      expv[21] = 8'h57;
      expv[22] = 8'h1e;
      expv[23] = 8'h94;
      expv[24] = 8'h37;
      expv[25] = 8'hc5;
      expv[26] = 8'hde;
      expv[27] = 8'hd6;
      expv[28] = 8'hb9;
      expv[29] = 8'hc4;
      expv[30] = 8'h48;
      expv[31] = 8'h77;
      expv[32] = 8'h3f;
      expv[33] = 8'ha0;
      expv[34] = 8'he8;
      expv[35] = 8'h6a;
      expv[36] = 8'h00;
      expv[37] = 8'he8;
      expv[38] = 8'h73;
      expv[39] = 8'h0b;
      expv[40] = 8'hb2;
      expv[41] = 8'h5b;
      expv[42] = 8'h83;
      expv[43] = 8'h68;
      expv[44] = 8'hd8;
      expv[45] = 8'hc1;
      expv[46] = 8'h07;
      expv[47] = 8'h61;
      expv[48] = 8'h7a;
      expv[49] = 8'h60;
      expv[50] = 8'hf4;
      expv[51] = 8'hbe;
      expv[52] = 8'h29;
      expv[53] = 8'had;
      expv[54] = 8'hf5;
      expv[55] = 8'h3a;
      expv[56] = 8'h44;
      expv[57] = 8'h1e;
      expv[58] = 8'h66;
      expv[59] = 8'h99;
      expv[60] = 8'h02;
      expv[61] = 8'h5f;
      expv[62] = 8'hf8;
      expv[63] = 8'hff;
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
