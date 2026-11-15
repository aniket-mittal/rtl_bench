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

  ad_g2b dut (
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
    stim[0] = 8'hf7;
    stim[1] = 8'hca;
    stim[2] = 8'h84;
    stim[3] = 8'hbc;
    stim[4] = 8'hc7;
    stim[5] = 8'hd3;
    stim[6] = 8'h96;
    stim[7] = 8'h81;
    stim[8] = 8'h6a;
    stim[9] = 8'hbe;
    stim[10] = 8'h78;
    stim[11] = 8'h0b;
    stim[12] = 8'hd9;
    stim[13] = 8'h1e;
    stim[14] = 8'he6;
    stim[15] = 8'hb4;
    stim[16] = 8'hf3;
    stim[17] = 8'h57;
    stim[18] = 8'hc6;
    stim[19] = 8'h87;
    stim[20] = 8'h0c;
    stim[21] = 8'h01;
    stim[22] = 8'h4d;
    stim[23] = 8'h9d;
    stim[24] = 8'h85;
    stim[25] = 8'h7a;
    stim[26] = 8'h4e;
    stim[27] = 8'hd4;
    stim[28] = 8'hd0;
    stim[29] = 8'h0e;
    stim[30] = 8'ha3;
    stim[31] = 8'h3e;
    stim[32] = 8'h1b;
    stim[33] = 8'he8;
    stim[34] = 8'hc2;
    stim[35] = 8'h9c;
    stim[36] = 8'hea;
    stim[37] = 8'h91;
    stim[38] = 8'he4;
    stim[39] = 8'h8d;
    stim[40] = 8'h03;
    stim[41] = 8'hf8;
    stim[42] = 8'hce;
    stim[43] = 8'h0e;
    stim[44] = 8'h16;
    stim[45] = 8'hd3;
    stim[46] = 8'h0c;
    stim[47] = 8'hdf;
    stim[48] = 8'h41;
    stim[49] = 8'h40;
    stim[50] = 8'hbd;
    stim[51] = 8'hf7;
    stim[52] = 8'h28;
    stim[53] = 8'hf6;
    stim[54] = 8'h06;
    stim[55] = 8'h1c;
    stim[56] = 8'h7a;
    stim[57] = 8'h33;
    stim[58] = 8'h4f;
    stim[59] = 8'h07;
    stim[60] = 8'hdf;
    stim[61] = 8'h15;
    stim[62] = 8'hca;
    stim[63] = 8'h4c;
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
      expv[0] = 8'ha5;
      expv[1] = 8'h8c;
      expv[2] = 8'hf8;
      expv[3] = 8'hd7;
      expv[4] = 8'h85;
      expv[5] = 8'h9d;
      expv[6] = 8'he4;
      expv[7] = 8'hfe;
      expv[8] = 8'h4c;
      expv[9] = 8'hd4;
      expv[10] = 8'h50;
      expv[11] = 8'h0d;
      expv[12] = 8'h91;
      expv[13] = 8'h14;
      expv[14] = 8'hbb;
      expv[15] = 8'hd8;
      expv[16] = 8'ha2;
      expv[17] = 8'h65;
      expv[18] = 8'h84;
      expv[19] = 8'hfa;
      expv[20] = 8'h08;
      expv[21] = 8'h01;
      expv[22] = 8'h76;
      expv[23] = 8'he9;
      expv[24] = 8'hf9;
      expv[25] = 8'h53;
      expv[26] = 8'h74;
      expv[27] = 8'h98;
      expv[28] = 8'h9f;
      expv[29] = 8'h0b;
      expv[30] = 8'hc2;
      expv[31] = 8'h2b;
      expv[32] = 8'h12;
      expv[33] = 8'hb0;
      expv[34] = 8'h83;
      expv[35] = 8'he8;
      expv[36] = 8'hb3;
      expv[37] = 8'he1;
      expv[38] = 8'hb8;
      expv[39] = 8'hf6;
      expv[40] = 8'h02;
      expv[41] = 8'haf;
      expv[42] = 8'h8b;
      expv[43] = 8'h0b;
      expv[44] = 8'h1b;
      expv[45] = 8'h9d;
      expv[46] = 8'h08;
      expv[47] = 8'h95;
      expv[48] = 8'h7e;
      expv[49] = 8'h7f;
      expv[50] = 8'hd6;
      expv[51] = 8'ha5;
      expv[52] = 8'h30;
      expv[53] = 8'ha4;
      expv[54] = 8'h04;
      expv[55] = 8'h17;
      expv[56] = 8'h53;
      expv[57] = 8'h22;
      expv[58] = 8'h75;
      expv[59] = 8'h05;
      expv[60] = 8'h95;
      expv[61] = 8'h19;
      expv[62] = 8'h8c;
      expv[63] = 8'h77;
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
