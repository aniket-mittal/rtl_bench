// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04217 dut (
    .clk(clk),
    .rst(in_vec[14:14]),
    .phy_tx_mode(in_vec[13:13]),
    .rxd(in_vec[12:12]),
    .rxdp(in_vec[11:11]),
    .rxdn(in_vec[10:10]),
    .LineCtrl_i(in_vec[9:9]),
    .DataOut_i(in_vec[8:1]),
    .TxValid_i(in_vec[0:0]),
    .usb_rst(out_vec[21:21]),
    .txdp(out_vec[20:20]),
    .txdn(out_vec[19:19]),
    .txoe(out_vec[18:18]),
    .ce_o(out_vec[17:17]),
    .sync_err_o(out_vec[16:16]),
    .bit_stuff_err_o(out_vec[15:15]),
    .byte_err_o(out_vec[14:14]),
    .TxReady_o(out_vec[13:13]),
    .DataIn_o(out_vec[12:5]),
    .RxValid_o(out_vec[4:4]),
    .RxActive_o(out_vec[3:3]),
    .RxError_o(out_vec[2:2]),
    .LineState_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h7b22;
    stim[1] = 15'h4fad;
    stim[2] = 15'h3fed;
    stim[3] = 15'h15d9;
    stim[4] = 15'h0996;
    stim[5] = 15'h19b3;
    stim[6] = 15'h2483;
    stim[7] = 15'h2462;
    stim[8] = 15'h385c;
    stim[9] = 15'h0b45;
    stim[10] = 15'h0be9;
    stim[11] = 15'h05ce;
    stim[12] = 15'h29ed;
    stim[13] = 15'h068f;
    stim[14] = 15'h281e;
    stim[15] = 15'h144e;
    stim[16] = 15'h26f0;
    stim[17] = 15'h21e4;
    stim[18] = 15'h0563;
    stim[19] = 15'h0bd5;
    stim[20] = 15'h169d;
    stim[21] = 15'h1003;
    stim[22] = 15'h2230;
    stim[23] = 15'h27da;
    stim[24] = 15'h1871;
    stim[25] = 15'h16af;
    stim[26] = 15'h2670;
    stim[27] = 15'h3289;
    stim[28] = 15'h1063;
    stim[29] = 15'h214e;
    stim[30] = 15'h09ae;
    stim[31] = 15'h358e;
    stim[32] = 15'h30aa;
    stim[33] = 15'h25a9;
    stim[34] = 15'h2d60;
    stim[35] = 15'h398d;
    stim[36] = 15'h358d;
    stim[37] = 15'h1acc;
    stim[38] = 15'h1485;
    stim[39] = 15'h1f1f;
    stim[40] = 15'h0440;
    stim[41] = 15'h36b8;
    stim[42] = 15'h06ca;
    stim[43] = 15'h02c0;
    stim[44] = 15'h1a9c;
    stim[45] = 15'h3b85;
    stim[46] = 15'h34e2;
    stim[47] = 15'h0609;
    stim[48] = 15'h1449;
    stim[49] = 15'h3a5e;
    stim[50] = 15'h1e4b;
    stim[51] = 15'h2de7;
    stim[52] = 15'h0687;
    stim[53] = 15'h1445;
    stim[54] = 15'h324c;
    stim[55] = 15'h132e;
    stim[56] = 15'h2f1d;
    stim[57] = 15'h1367;
    stim[58] = 15'h21a4;
    stim[59] = 15'h0239;
    stim[60] = 15'h3bf8;
    stim[61] = 15'h3c0a;
    stim[62] = 15'h2725;
    stim[63] = 15'h21f7;
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
      expv[0] = 22'h1420xx;
      expv[1] = 22'h0820xx;
      expv[2] = 22'h1020xx;
      expv[3] = 22'h0020xx;
      expv[4] = 22'h1c20xx;
      expv[5] = 22'h1020xx;
      expv[6] = 22'h0820xx;
      expv[7] = 22'h0c20xx;
      expv[8] = 22'h0c20xx;
      expv[9] = 22'h0820xx;
      expv[10] = 22'h0020xx;
      expv[11] = 22'h1c20xx;
      expv[12] = 22'h0820xx;
      expv[13] = 22'h1820xx;
      expv[14] = 22'h0c20xx;
      expv[15] = 22'h1c20xx;
      expv[16] = 22'h1420xx;
      expv[17] = 22'h0c20xx;
      expv[18] = 22'h1020xx;
      expv[19] = 22'h0820xx;
      expv[20] = 22'h0820xx;
      expv[21] = 22'h1020xx;
      expv[22] = 22'h1420xx;
      expv[23] = 22'h1420xx;
      expv[24] = 22'h0020xx;
      expv[25] = 22'h1820xx;
      expv[26] = 22'h1420xx;
      expv[27] = 22'h1020xx;
      expv[28] = 22'h1020xx;
      expv[29] = 22'h0c20xx;
      expv[30] = 22'h1c20xx;
      expv[31] = 22'h0c20xx;
      expv[32] = 22'h0c20xx;
      expv[33] = 22'h0820xx;
      expv[34] = 22'h0c20xx;
      expv[35] = 22'h0820xx;
      expv[36] = 22'h0820xx;
      expv[37] = 22'h0c20xx;
      expv[38] = 22'h0820xx;
      expv[39] = 22'h1820xx;
      expv[40] = 22'h0420xx;
      expv[41] = 22'h1420xx;
      expv[42] = 22'h1420xx;
      expv[43] = 22'h0420xx;
      expv[44] = 22'h0c20xx;
      expv[45] = 22'h1020xx;
      expv[46] = 22'h0c20xx;
      expv[47] = 22'h0020xx;
      expv[48] = 22'h0020xx;
      expv[49] = 22'h1420xx;
      expv[50] = 22'h1020xx;
      expv[51] = 22'h0820xx;
      expv[52] = 22'h1820xx;
      expv[53] = 22'h0820xx;
      expv[54] = 22'h1420xx;
      expv[55] = 22'h1c20xx;
      expv[56] = 22'h1020xx;
      expv[57] = 22'h1820xx;
      expv[58] = 22'h0c20xx;
      expv[59] = 22'h0020xx;
      expv[60] = 22'h1420xx;
      expv[61] = 22'h0c20xx;
      expv[62] = 22'h1020xx;
      expv[63] = 22'h0820xx;
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
