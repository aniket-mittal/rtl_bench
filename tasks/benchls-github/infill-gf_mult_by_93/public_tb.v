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

  gf_mult_by_93 dut (
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
    stim[0] = 8'h2e;
    stim[1] = 8'hab;
    stim[2] = 8'h8d;
    stim[3] = 8'hf2;
    stim[4] = 8'h81;
    stim[5] = 8'h57;
    stim[6] = 8'h64;
    stim[7] = 8'hf4;
    stim[8] = 8'h39;
    stim[9] = 8'h4d;
    stim[10] = 8'h18;
    stim[11] = 8'h67;
    stim[12] = 8'h5c;
    stim[13] = 8'hf0;
    stim[14] = 8'hf1;
    stim[15] = 8'hbc;
    stim[16] = 8'hd6;
    stim[17] = 8'h13;
    stim[18] = 8'h1b;
    stim[19] = 8'h63;
    stim[20] = 8'hd5;
    stim[21] = 8'hf8;
    stim[22] = 8'h00;
    stim[23] = 8'h96;
    stim[24] = 8'h27;
    stim[25] = 8'h27;
    stim[26] = 8'h8b;
    stim[27] = 8'h57;
    stim[28] = 8'h22;
    stim[29] = 8'h88;
    stim[30] = 8'he6;
    stim[31] = 8'hc2;
    stim[32] = 8'hf2;
    stim[33] = 8'hff;
    stim[34] = 8'hbb;
    stim[35] = 8'ha5;
    stim[36] = 8'h19;
    stim[37] = 8'hdb;
    stim[38] = 8'h66;
    stim[39] = 8'hb6;
    stim[40] = 8'he9;
    stim[41] = 8'h6c;
    stim[42] = 8'h84;
    stim[43] = 8'hd4;
    stim[44] = 8'hf3;
    stim[45] = 8'hf0;
    stim[46] = 8'hd9;
    stim[47] = 8'hd8;
    stim[48] = 8'hf0;
    stim[49] = 8'h48;
    stim[50] = 8'hdb;
    stim[51] = 8'h28;
    stim[52] = 8'h8e;
    stim[53] = 8'hdf;
    stim[54] = 8'h78;
    stim[55] = 8'h89;
    stim[56] = 8'h53;
    stim[57] = 8'h44;
    stim[58] = 8'h57;
    stim[59] = 8'h18;
    stim[60] = 8'h9d;
    stim[61] = 8'hbd;
    stim[62] = 8'hd7;
    stim[63] = 8'h3c;
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
      expv[0] = 8'h36;
      expv[1] = 8'hb5;
      expv[2] = 8'h6f;
      expv[3] = 8'h3c;
      expv[4] = 8'hf5;
      expv[5] = 8'h28;
      expv[6] = 8'hd2;
      expv[7] = 8'h71;
      expv[8] = 8'h2d;
      expv[9] = 8'h3a;
      expv[10] = 8'h29;
      expv[11] = 8'h7a;
      expv[12] = 8'h6c;
      expv[13] = 8'h07;
      expv[14] = 8'h94;
      expv[15] = 8'hae;
      expv[16] = 8'hdd;
      expv[17] = 8'h6d;
      expv[18] = 8'h81;
      expv[19] = 8'h0c;
      expv[20] = 8'h75;
      expv[21] = 8'heb;
      expv[22] = 8'h00;
      expv[23] = 8'hee;
      expv[24] = 8'h49;
      expv[25] = 8'h49;
      expv[26] = 8'h22;
      expv[27] = 8'h28;
      expv[28] = 8'hac;
      expv[29] = 8'h8a;
      expv[30] = 8'h8f;
      expv[31] = 8'h6e;
      expv[32] = 8'h3c;
      expv[33] = 8'h35;
      expv[34] = 8'h70;
      expv[35] = 8'h14;
      expv[36] = 8'hba;
      expv[37] = 8'hd4;
      expv[38] = 8'he9;
      expv[39] = 8'h79;
      expv[40] = 8'hbd;
      expv[41] = 8'h3e;
      expv[42] = 8'h10;
      expv[43] = 8'he6;
      expv[44] = 8'haf;
      expv[45] = 8'h07;
      expv[46] = 8'hef;
      expv[47] = 8'h7c;
      expv[48] = 8'h07;
      expv[49] = 8'hdf;
      expv[50] = 8'hd4;
      expv[51] = 8'h7b;
      expv[52] = 8'hc7;
      expv[53] = 8'ha2;
      expv[54] = 8'h8d;
      expv[55] = 8'h19;
      expv[56] = 8'h5e;
      expv[57] = 8'h45;
      expv[58] = 8'h28;
      expv[59] = 8'h29;
      expv[60] = 8'haa;
      expv[61] = 8'h3d;
      expv[62] = 8'h4e;
      expv[63] = 8'hc8;
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
