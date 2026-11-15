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

  rtlpp_00031 dut (
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
    stim[0] = 15'h7b4f;
    stim[1] = 15'h4d07;
    stim[2] = 15'h6282;
    stim[3] = 15'h26ec;
    stim[4] = 15'h3cae;
    stim[5] = 15'h13cc;
    stim[6] = 15'h06e9;
    stim[7] = 15'h1a79;
    stim[8] = 15'h2636;
    stim[9] = 15'h3642;
    stim[10] = 15'h0961;
    stim[11] = 15'h21a8;
    stim[12] = 15'h3cb3;
    stim[13] = 15'h390d;
    stim[14] = 15'h1a7a;
    stim[15] = 15'h07a0;
    stim[16] = 15'h1208;
    stim[17] = 15'h3d22;
    stim[18] = 15'h3651;
    stim[19] = 15'h2e00;
    stim[20] = 15'h0f4d;
    stim[21] = 15'h0727;
    stim[22] = 15'h261d;
    stim[23] = 15'h35bd;
    stim[24] = 15'h1e00;
    stim[25] = 15'h2e24;
    stim[26] = 15'h08b6;
    stim[27] = 15'h04f1;
    stim[28] = 15'h02a7;
    stim[29] = 15'h3dcd;
    stim[30] = 15'h0991;
    stim[31] = 15'h14bf;
    stim[32] = 15'h305e;
    stim[33] = 15'h24f2;
    stim[34] = 15'h0524;
    stim[35] = 15'h3841;
    stim[36] = 15'h1417;
    stim[37] = 15'h26d2;
    stim[38] = 15'h1e36;
    stim[39] = 15'h3026;
    stim[40] = 15'h3416;
    stim[41] = 15'h28be;
    stim[42] = 15'h04bb;
    stim[43] = 15'h105b;
    stim[44] = 15'h2a58;
    stim[45] = 15'h2b04;
    stim[46] = 15'h32dd;
    stim[47] = 15'h27c5;
    stim[48] = 15'h3312;
    stim[49] = 15'h0217;
    stim[50] = 15'h0a27;
    stim[51] = 15'h2f50;
    stim[52] = 15'h3e3d;
    stim[53] = 15'h2c3e;
    stim[54] = 15'h0407;
    stim[55] = 15'h364a;
    stim[56] = 15'h292a;
    stim[57] = 15'h0741;
    stim[58] = 15'h22c0;
    stim[59] = 15'h0c54;
    stim[60] = 15'h2384;
    stim[61] = 15'h0f2a;
    stim[62] = 15'h3e6f;
    stim[63] = 15'h11c5;
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
      expv[0] = 22'h040002;
      expv[1] = 22'h00141b;
      expv[2] = 22'h041a98;
      expv[3] = 22'h040001;
      expv[4] = 22'h040003;
      expv[5] = 22'h000000;
      expv[6] = 22'h000001;
      expv[7] = 22'h002002;
      expv[8] = 22'h042001;
      expv[9] = 22'h040001;
      expv[10] = 22'h000002;
      expv[11] = 22'h042000;
      expv[12] = 22'h040003;
      expv[13] = 22'h142002;
      expv[14] = 22'h002002;
      expv[15] = 22'h000001;
      expv[16] = 22'h000000;
      expv[17] = 22'h040003;
      expv[18] = 22'h040001;
      expv[19] = 22'h042003;
      expv[20] = 22'h000003;
      expv[21] = 22'h002001;
      expv[22] = 22'h042001;
      expv[23] = 22'h042001;
      expv[24] = 22'h002003;
      expv[25] = 22'h040003;
      expv[26] = 22'h000002;
      expv[27] = 22'h000001;
      expv[28] = 22'h002000;
      expv[29] = 22'h142003;
      expv[30] = 22'h002002;
      expv[31] = 22'h002001;
      expv[32] = 22'h142000;
      expv[33] = 22'h140001;
      expv[34] = 22'h100001;
      expv[35] = 22'h140002;
      expv[36] = 22'h002001;
      expv[37] = 22'h042001;
      expv[38] = 22'h000003;
      expv[39] = 22'h040000;
      expv[40] = 22'h040001;
      expv[41] = 22'h040002;
      expv[42] = 22'h000001;
      expv[43] = 22'h102000;
      expv[44] = 22'h042002;
      expv[45] = 22'h040002;
      expv[46] = 22'h040000;
      expv[47] = 22'h042001;
      expv[48] = 22'h042000;
      expv[49] = 22'h000000;
      expv[50] = 22'h002002;
      expv[51] = 22'h042003;
      expv[52] = 22'h040003;
      expv[53] = 22'h042003;
      expv[54] = 22'h000001;
      expv[55] = 22'h042001;
      expv[56] = 22'h040002;
      expv[57] = 22'h000001;
      expv[58] = 22'h042000;
      expv[59] = 22'h000003;
      expv[60] = 22'h040000;
      expv[61] = 22'h000003;
      expv[62] = 22'h040003;
      expv[63] = 22'h002000;
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
