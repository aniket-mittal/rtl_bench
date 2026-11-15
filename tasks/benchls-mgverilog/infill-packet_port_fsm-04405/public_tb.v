// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04405 dut (
    .clk(clk),
    .reset_b(in_vec[11:11]),
    .fifo_empty(in_vec[10:10]),
    .fifo_data(in_vec[9:1]),
    .read(in_vec[0:0]),
    .fifo_read(out_vec[9:9]),
    .ready(out_vec[8:8]),
    .port(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h5c9;
    stim[1] = 12'h1dd;
    stim[2] = 12'hc7e;
    stim[3] = 12'h9b2;
    stim[4] = 12'hf19;
    stim[5] = 12'hbf1;
    stim[6] = 12'haf8;
    stim[7] = 12'he0b;
    stim[8] = 12'hc30;
    stim[9] = 12'hc0c;
    stim[10] = 12'hd65;
    stim[11] = 12'hedc;
    stim[12] = 12'h8ed;
    stim[13] = 12'hf5f;
    stim[14] = 12'h84c;
    stim[15] = 12'haf3;
    stim[16] = 12'hcbe;
    stim[17] = 12'h904;
    stim[18] = 12'h95f;
    stim[19] = 12'hdb3;
    stim[20] = 12'h84c;
    stim[21] = 12'hfdf;
    stim[22] = 12'hc49;
    stim[23] = 12'h8cb;
    stim[24] = 12'h89e;
    stim[25] = 12'h9b4;
    stim[26] = 12'hb94;
    stim[27] = 12'h959;
    stim[28] = 12'ha5c;
    stim[29] = 12'hb55;
    stim[30] = 12'ha38;
    stim[31] = 12'h9df;
    stim[32] = 12'h8cd;
    stim[33] = 12'ha20;
    stim[34] = 12'h97b;
    stim[35] = 12'hcfd;
    stim[36] = 12'hd1a;
    stim[37] = 12'he71;
    stim[38] = 12'hf1d;
    stim[39] = 12'ha32;
    stim[40] = 12'hdb9;
    stim[41] = 12'hbca;
    stim[42] = 12'ha0a;
    stim[43] = 12'hbde;
    stim[44] = 12'hd36;
    stim[45] = 12'h969;
    stim[46] = 12'hb50;
    stim[47] = 12'hfc4;
    stim[48] = 12'he54;
    stim[49] = 12'hc63;
    stim[50] = 12'hcc5;
    stim[51] = 12'hcd4;
    stim[52] = 12'hc99;
    stim[53] = 12'ha83;
    stim[54] = 12'h81c;
    stim[55] = 12'hc62;
    stim[56] = 12'hdd5;
    stim[57] = 12'hd85;
    stim[58] = 12'h804;
    stim[59] = 12'hc80;
    stim[60] = 12'hf94;
    stim[61] = 12'hc60;
    stim[62] = 12'hdf9;
    stim[63] = 12'hf4d;
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
      expv[1] = 10'h300;
      expv[2] = 10'h000;
      expv[3] = 10'h100;
      expv[4] = 10'h000;
      expv[5] = 10'h300;
      expv[6] = 10'h1f8;
      expv[7] = 10'h17c;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h300;
      expv[13] = 10'h076;
      expv[14] = 10'h1af;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h300;
      expv[19] = 10'h0af;
      expv[20] = 10'h1d9;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h100;
      expv[25] = 10'h100;
      expv[26] = 10'h100;
      expv[27] = 10'h300;
      expv[28] = 10'h1ac;
      expv[29] = 10'h12e;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h100;
      expv[34] = 10'h300;
      expv[35] = 10'h0bd;
      expv[36] = 10'h17e;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h100;
      expv[42] = 10'h100;
      expv[43] = 10'h100;
      expv[44] = 10'h000;
      expv[45] = 10'h300;
      expv[46] = 10'h1b4;
      expv[47] = 10'h1a8;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h300;
      expv[54] = 10'h141;
      expv[55] = 10'h00e;
      expv[56] = 10'h131;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
