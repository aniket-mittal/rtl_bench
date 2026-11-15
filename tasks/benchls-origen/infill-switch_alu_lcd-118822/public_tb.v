// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118822 dut (
    .SWI(in_vec[7:0]),
    .LED(out_vec[22:15]),
    .SEG(out_vec[14:7]),
    .lcd_e(out_vec[6:6]),
    .lcd_rs(out_vec[5:5]),
    .lcd_rw(out_vec[4:4]),
    .lcd_dat(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h36;
    stim[1] = 8'h5a;
    stim[2] = 8'h7f;
    stim[3] = 8'hb2;
    stim[4] = 8'hdc;
    stim[5] = 8'h8f;
    stim[6] = 8'hf9;
    stim[7] = 8'h8b;
    stim[8] = 8'h4c;
    stim[9] = 8'h9a;
    stim[10] = 8'h87;
    stim[11] = 8'h5c;
    stim[12] = 8'ha2;
    stim[13] = 8'h93;
    stim[14] = 8'hde;
    stim[15] = 8'h0a;
    stim[16] = 8'h01;
    stim[17] = 8'h6f;
    stim[18] = 8'h0f;
    stim[19] = 8'h55;
    stim[20] = 8'h09;
    stim[21] = 8'hd1;
    stim[22] = 8'h6b;
    stim[23] = 8'he5;
    stim[24] = 8'hde;
    stim[25] = 8'h7d;
    stim[26] = 8'h4c;
    stim[27] = 8'h2a;
    stim[28] = 8'h53;
    stim[29] = 8'h43;
    stim[30] = 8'hb3;
    stim[31] = 8'h0a;
    stim[32] = 8'h88;
    stim[33] = 8'h65;
    stim[34] = 8'h63;
    stim[35] = 8'h06;
    stim[36] = 8'hd3;
    stim[37] = 8'h39;
    stim[38] = 8'h90;
    stim[39] = 8'h93;
    stim[40] = 8'he0;
    stim[41] = 8'h19;
    stim[42] = 8'h3d;
    stim[43] = 8'hb2;
    stim[44] = 8'h35;
    stim[45] = 8'h17;
    stim[46] = 8'h91;
    stim[47] = 8'hf7;
    stim[48] = 8'hd0;
    stim[49] = 8'hec;
    stim[50] = 8'hb3;
    stim[51] = 8'h44;
    stim[52] = 8'hd3;
    stim[53] = 8'h64;
    stim[54] = 8'h9a;
    stim[55] = 8'h1f;
    stim[56] = 8'haa;
    stim[57] = 8'h6b;
    stim[58] = 8'hf4;
    stim[59] = 8'h07;
    stim[60] = 8'h60;
    stim[61] = 8'hd5;
    stim[62] = 8'h04;
    stim[63] = 8'h81;
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
      expv[0] = 23'h000000;
      expv[1] = 23'h018000;
      expv[2] = 23'h000000;
      expv[3] = 23'h000000;
      expv[4] = 23'h000000;
      expv[5] = 23'h018000;
      expv[6] = 23'h018000;
      expv[7] = 23'h010000;
      expv[8] = 23'h000000;
      expv[9] = 23'h010000;
      expv[10] = 23'h008000;
      expv[11] = 23'h000000;
      expv[12] = 23'h010000;
      expv[13] = 23'h018000;
      expv[14] = 23'h010000;
      expv[15] = 23'h010000;
      expv[16] = 23'h000000;
      expv[17] = 23'h000000;
      expv[18] = 23'h018000;
      expv[19] = 23'h018000;
      expv[20] = 23'h000000;
      expv[21] = 23'h018000;
      expv[22] = 23'h008000;
      expv[23] = 23'h000000;
      expv[24] = 23'h010000;
      expv[25] = 23'h010000;
      expv[26] = 23'h000000;
      expv[27] = 23'h000000;
      expv[28] = 23'h018000;
      expv[29] = 23'h018000;
      expv[30] = 23'h000000;
      expv[31] = 23'h010000;
      expv[32] = 23'h000000;
      expv[33] = 23'h000000;
      expv[34] = 23'h018000;
      expv[35] = 23'h000000;
      expv[36] = 23'h018000;
      expv[37] = 23'h000000;
      expv[38] = 23'h000000;
      expv[39] = 23'h018000;
      expv[40] = 23'h000000;
      expv[41] = 23'h018000;
      expv[42] = 23'h000000;
      expv[43] = 23'h000000;
      expv[44] = 23'h000000;
      expv[45] = 23'h018000;
      expv[46] = 23'h008000;
      expv[47] = 23'h010000;
      expv[48] = 23'h018000;
      expv[49] = 23'h008000;
      expv[50] = 23'h000000;
      expv[51] = 23'h000000;
      expv[52] = 23'h018000;
      expv[53] = 23'h018000;
      expv[54] = 23'h010000;
      expv[55] = 23'h018000;
      expv[56] = 23'h000000;
      expv[57] = 23'h008000;
      expv[58] = 23'h018000;
      expv[59] = 23'h008000;
      expv[60] = 23'h000000;
      expv[61] = 23'h018000;
      expv[62] = 23'h000000;
      expv[63] = 23'h000000;
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
