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

  origen_210950 dut (
    .alu_op(in_vec[7:6]),
    .funct(in_vec[5:0]),
    .alu_ctrl(out_vec[8:6]),
    .jr(out_vec[5:5]),
    .MHI(out_vec[4:4]),
    .MLO(out_vec[3:3]),
    .HILO(out_vec[2:2]),
    .MultToReg(out_vec[1:1]),
    .shift(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'ha6;
    stim[1] = 8'h2a;
    stim[2] = 8'h35;
    stim[3] = 8'h4e;
    stim[4] = 8'h7b;
    stim[5] = 8'h1c;
    stim[6] = 8'h5a;
    stim[7] = 8'h3f;
    stim[8] = 8'h75;
    stim[9] = 8'ha4;
    stim[10] = 8'he9;
    stim[11] = 8'h56;
    stim[12] = 8'hc7;
    stim[13] = 8'h95;
    stim[14] = 8'h64;
    stim[15] = 8'he0;
    stim[16] = 8'hcb;
    stim[17] = 8'h73;
    stim[18] = 8'h26;
    stim[19] = 8'h44;
    stim[20] = 8'h36;
    stim[21] = 8'hf8;
    stim[22] = 8'h00;
    stim[23] = 8'h0e;
    stim[24] = 8'h42;
    stim[25] = 8'h67;
    stim[26] = 8'hf0;
    stim[27] = 8'hda;
    stim[28] = 8'hba;
    stim[29] = 8'h44;
    stim[30] = 8'hca;
    stim[31] = 8'h51;
    stim[32] = 8'h27;
    stim[33] = 8'hfd;
    stim[34] = 8'h41;
    stim[35] = 8'h09;
    stim[36] = 8'h07;
    stim[37] = 8'had;
    stim[38] = 8'h05;
    stim[39] = 8'h0d;
    stim[40] = 8'hba;
    stim[41] = 8'hb8;
    stim[42] = 8'h7d;
    stim[43] = 8'hb1;
    stim[44] = 8'hd3;
    stim[45] = 8'hd7;
    stim[46] = 8'h33;
    stim[47] = 8'hc2;
    stim[48] = 8'h07;
    stim[49] = 8'hec;
    stim[50] = 8'h67;
    stim[51] = 8'h27;
    stim[52] = 8'ha2;
    stim[53] = 8'hfc;
    stim[54] = 8'ha5;
    stim[55] = 8'h58;
    stim[56] = 8'h4b;
    stim[57] = 8'h57;
    stim[58] = 8'hdb;
    stim[59] = 8'h67;
    stim[60] = 8'h12;
    stim[61] = 8'hca;
    stim[62] = 8'h7f;
    stim[63] = 8'hc6;
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
      expv[1] = 9'h080;
      expv[2] = 9'h080;
      expv[3] = 9'h180;
      expv[4] = 9'h180;
      expv[5] = 9'h080;
      expv[6] = 9'h180;
      expv[7] = 9'h080;
      expv[8] = 9'h180;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h180;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h180;
      expv[15] = 9'h080;
      expv[16] = 9'h000;
      expv[17] = 9'h180;
      expv[18] = 9'h080;
      expv[19] = 9'h180;
      expv[20] = 9'h080;
      expv[21] = 9'h000;
      expv[22] = 9'h080;
      expv[23] = 9'h080;
      expv[24] = 9'h180;
      expv[25] = 9'h180;
      expv[26] = 9'h000;
      expv[27] = 9'h01e;
      expv[28] = 9'h000;
      expv[29] = 9'h180;
      expv[30] = 9'h000;
      expv[31] = 9'h180;
      expv[32] = 9'h080;
      expv[33] = 9'h000;
      expv[34] = 9'h180;
      expv[35] = 9'h080;
      expv[36] = 9'h080;
      expv[37] = 9'h000;
      expv[38] = 9'h080;
      expv[39] = 9'h080;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h180;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h080;
      expv[47] = 9'h141;
      expv[48] = 9'h080;
      expv[49] = 9'h000;
      expv[50] = 9'h180;
      expv[51] = 9'h080;
      expv[52] = 9'h180;
      expv[53] = 9'h000;
      expv[54] = 9'h040;
      expv[55] = 9'h180;
      expv[56] = 9'h180;
      expv[57] = 9'h180;
      expv[58] = 9'h000;
      expv[59] = 9'h180;
      expv[60] = 9'h080;
      expv[61] = 9'h000;
      expv[62] = 9'h180;
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
