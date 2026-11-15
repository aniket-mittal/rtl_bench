// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 192;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_019354 dut (
    .isData(clk),
    .SPI_data(in_vec[23:8]),
    .N(in_vec[7:0]),
    .CMD1(out_vec[191:176]),
    .CMD2(out_vec[175:160]),
    .Eth_I_max(out_vec[159:144]),
    .Eth_I_min(out_vec[143:128]),
    .Eth_Temp_max(out_vec[127:112]),
    .Eth_I_work(out_vec[111:96]),
    .Eth_kor(out_vec[95:80]),
    .Eth_Imp_time(out_vec[79:64]),
    .Eth_Start(out_vec[63:48]),
    .Eth_Full_stop(out_vec[47:32]),
    .Eth_Calibr(out_vec[31:16]),
    .Eth_Ch_num(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h99c30b;
    stim[1] = 24'h281a6d;
    stim[2] = 24'h077f99;
    stim[3] = 24'h894d34;
    stim[4] = 24'h52db9f;
    stim[5] = 24'h66ee06;
    stim[6] = 24'hde6e64;
    stim[7] = 24'hfbf907;
    stim[8] = 24'h100582;
    stim[9] = 24'h4f7544;
    stim[10] = 24'h11bc65;
    stim[11] = 24'h6c8305;
    stim[12] = 24'h7c592a;
    stim[13] = 24'h87265f;
    stim[14] = 24'h555bab;
    stim[15] = 24'he98ab8;
    stim[16] = 24'hedafc0;
    stim[17] = 24'h7ac2cc;
    stim[18] = 24'h7ecd61;
    stim[19] = 24'h4641bf;
    stim[20] = 24'h22429b;
    stim[21] = 24'hdea0a7;
    stim[22] = 24'h0d7196;
    stim[23] = 24'hf8022e;
    stim[24] = 24'hcbda60;
    stim[25] = 24'h024d58;
    stim[26] = 24'h9a44a2;
    stim[27] = 24'h3c9213;
    stim[28] = 24'hd38161;
    stim[29] = 24'h57e4fa;
    stim[30] = 24'h7fe432;
    stim[31] = 24'h85a54e;
    stim[32] = 24'hf03d75;
    stim[33] = 24'h5e3369;
    stim[34] = 24'hac48aa;
    stim[35] = 24'h111c1b;
    stim[36] = 24'h18d18f;
    stim[37] = 24'h1f4520;
    stim[38] = 24'h5f31c3;
    stim[39] = 24'h309993;
    stim[40] = 24'he5d005;
    stim[41] = 24'h226dda;
    stim[42] = 24'hdf9fbb;
    stim[43] = 24'h11230b;
    stim[44] = 24'h84e610;
    stim[45] = 24'h05be83;
    stim[46] = 24'h1dc637;
    stim[47] = 24'hed935a;
    stim[48] = 24'hd019ef;
    stim[49] = 24'h20d802;
    stim[50] = 24'h767a93;
    stim[51] = 24'h46f95c;
    stim[52] = 24'h80c015;
    stim[53] = 24'h65660d;
    stim[54] = 24'hf9393d;
    stim[55] = 24'h45af68;
    stim[56] = 24'h74103d;
    stim[57] = 24'h49d40b;
    stim[58] = 24'hf46f5e;
    stim[59] = 24'h3ae16f;
    stim[60] = 24'had202a;
    stim[61] = 24'h5971bb;
    stim[62] = 24'hb03af6;
    stim[63] = 24'h5ffdb6;
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
      expv[0] = 192'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 192'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx99c3xxxx;
      expv[2] = 192'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx99c3xxxx;
      expv[3] = 192'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx99c3xxxx;
      expv[4] = 192'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx99c3xxxx;
      expv[5] = 192'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx99c3xxxx;
      expv[6] = 192'hxxxxxxxxxxxxxxxxxxxx66eexxxxxxxxxxxxxxxx99c3xxxx;
      expv[7] = 192'hxxxxxxxxxxxxxxxxxxxx66eexxxxxxxxxxxxxxxx99c3xxxx;
      expv[8] = 192'hxxxxxxxxxxxxxxxxxxxx66eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[9] = 192'hxxxxxxxxxxxxxxxxxxxx66eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[10] = 192'hxxxxxxxxxxxxxxxxxxxx66eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[11] = 192'hxxxxxxxxxxxxxxxxxxxx66eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[12] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[13] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[14] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[15] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[16] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[17] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[18] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[19] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[20] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[21] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[22] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[23] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[24] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[25] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[26] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[27] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[28] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[29] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[30] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[31] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[32] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[33] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[34] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[35] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[36] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[37] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[38] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[39] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[40] = 192'hxxxxxxxxxxxxxxxx6c8366eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[41] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[42] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[43] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx99c3xxxx;
      expv[44] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[45] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[46] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[47] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[48] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[49] = 192'hxxxxxxxxxxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[50] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[51] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[52] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[53] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[54] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[55] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[56] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[57] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx1123xxxx;
      expv[58] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx49d4xxxx;
      expv[59] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx49d4xxxx;
      expv[60] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx49d4xxxx;
      expv[61] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx49d4xxxx;
      expv[62] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx49d4xxxx;
      expv[63] = 192'hxxxx20d8xxxxxxxxe5d066eefbf9xxxxxxxxxxxx49d4xxxx;
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
