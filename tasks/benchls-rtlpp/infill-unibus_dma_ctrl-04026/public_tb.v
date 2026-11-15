// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04026 dut (
    .clk(clk),
    .RSYNC(in_vec[7:7]),
    .RRPLY(in_vec[6:6]),
    .RDMR(in_vec[5:5]),
    .RSACK(in_vec[4:4]),
    .RINIT(in_vec[3:3]),
    .RDMGI(in_vec[2:2]),
    .dma_read(in_vec[1:1]),
    .dma_write(in_vec[0:0]),
    .TSYNC(out_vec[9:9]),
    .TDIN(out_vec[8:8]),
    .TDOUT(out_vec[7:7]),
    .TDMR(out_vec[6:6]),
    .TSACK(out_vec[5:5]),
    .TDMGO(out_vec[4:4]),
    .assert_addr(out_vec[3:3]),
    .assert_data(out_vec[2:2]),
    .latch_read_data(out_vec[1:1]),
    .nxm(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h68;
    stim[1] = 8'hea;
    stim[2] = 8'hf2;
    stim[3] = 8'h20;
    stim[4] = 8'h92;
    stim[5] = 8'h96;
    stim[6] = 8'ha4;
    stim[7] = 8'h42;
    stim[8] = 8'h53;
    stim[9] = 8'h37;
    stim[10] = 8'he3;
    stim[11] = 8'hc7;
    stim[12] = 8'h86;
    stim[13] = 8'hc9;
    stim[14] = 8'h43;
    stim[15] = 8'h75;
    stim[16] = 8'h55;
    stim[17] = 8'hf6;
    stim[18] = 8'h35;
    stim[19] = 8'hc5;
    stim[20] = 8'hd1;
    stim[21] = 8'h92;
    stim[22] = 8'hf4;
    stim[23] = 8'hb5;
    stim[24] = 8'hb3;
    stim[25] = 8'hf7;
    stim[26] = 8'ha3;
    stim[27] = 8'hd0;
    stim[28] = 8'hd7;
    stim[29] = 8'h17;
    stim[30] = 8'he0;
    stim[31] = 8'h91;
    stim[32] = 8'h37;
    stim[33] = 8'he7;
    stim[34] = 8'hd7;
    stim[35] = 8'hb6;
    stim[36] = 8'h65;
    stim[37] = 8'h65;
    stim[38] = 8'h05;
    stim[39] = 8'hc3;
    stim[40] = 8'hc7;
    stim[41] = 8'h11;
    stim[42] = 8'h31;
    stim[43] = 8'hd6;
    stim[44] = 8'h57;
    stim[45] = 8'h70;
    stim[46] = 8'h87;
    stim[47] = 8'h74;
    stim[48] = 8'h93;
    stim[49] = 8'h36;
    stim[50] = 8'h21;
    stim[51] = 8'h76;
    stim[52] = 8'hb3;
    stim[53] = 8'hb5;
    stim[54] = 8'h35;
    stim[55] = 8'ha3;
    stim[56] = 8'ha6;
    stim[57] = 8'h67;
    stim[58] = 8'ha3;
    stim[59] = 8'he1;
    stim[60] = 8'h47;
    stim[61] = 8'h74;
    stim[62] = 8'hf2;
    stim[63] = 8'hb2;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h040;
      expv[4] = 10'h040;
      expv[5] = 10'h040;
      expv[6] = 10'h040;
      expv[7] = 10'h040;
      expv[8] = 10'h040;
      expv[9] = 10'h040;
      expv[10] = 10'h040;
      expv[11] = 10'h040;
      expv[12] = 10'h040;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h040;
      expv[16] = 10'h040;
      expv[17] = 10'h040;
      expv[18] = 10'h040;
      expv[19] = 10'h040;
      expv[20] = 10'h040;
      expv[21] = 10'h028;
      expv[22] = 10'h028;
      expv[23] = 10'h028;
      expv[24] = 10'h228;
      expv[25] = 10'h228;
      expv[26] = 10'h224;
      expv[27] = 10'h224;
      expv[28] = 10'h224;
      expv[29] = 10'h224;
      expv[30] = 10'h224;
      expv[31] = 10'h224;
      expv[32] = 10'h224;
      expv[33] = 10'h224;
      expv[34] = 10'h224;
      expv[35] = 10'h224;
      expv[36] = 10'h224;
      expv[37] = 10'h224;
      expv[38] = 10'h224;
      expv[39] = 10'h224;
      expv[40] = 10'h224;
      expv[41] = 10'h224;
      expv[42] = 10'h224;
      expv[43] = 10'h224;
      expv[44] = 10'h224;
      expv[45] = 10'h224;
      expv[46] = 10'h224;
      expv[47] = 10'h224;
      expv[48] = 10'h224;
      expv[49] = 10'h224;
      expv[50] = 10'h224;
      expv[51] = 10'h224;
      expv[52] = 10'h224;
      expv[53] = 10'h224;
      expv[54] = 10'h224;
      expv[55] = 10'h224;
      expv[56] = 10'h224;
      expv[57] = 10'h224;
      expv[58] = 10'h224;
      expv[59] = 10'h224;
      expv[60] = 10'h224;
      expv[61] = 10'h224;
      expv[62] = 10'h224;
      expv[63] = 10'h224;
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
