// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 88;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09476 dut (
    .clk(clk),
    .ff_tx_data(in_vec[86:55]),
    .ff_tx_eop(in_vec[54:54]),
    .ff_tx_err(in_vec[53:53]),
    .ff_tx_mod(in_vec[52:51]),
    .ff_tx_sop(in_vec[50:50]),
    .ff_tx_wren(in_vec[49:49]),
    .ff_tx_clk(in_vec[48:48]),
    .ff_rx_rdy(in_vec[47:47]),
    .ff_rx_clk(in_vec[46:46]),
    .address(in_vec[45:38]),
    .read(in_vec[37:37]),
    .writedata(in_vec[36:5]),
    .write(in_vec[4:4]),
    .reset(in_vec[3:3]),
    .mdio_in(in_vec[2:2]),
    .rxp(in_vec[1:1]),
    .ref_clk(in_vec[0:0]),
    .ff_tx_rdy(out_vec[87:87]),
    .ff_rx_data(out_vec[86:55]),
    .ff_rx_dval(out_vec[54:54]),
    .ff_rx_eop(out_vec[53:53]),
    .ff_rx_mod(out_vec[52:51]),
    .ff_rx_sop(out_vec[50:50]),
    .rx_err(out_vec[49:44]),
    .readdata(out_vec[43:12]),
    .waitrequest(out_vec[11:11]),
    .mdio_out(out_vec[10:10]),
    .mdio_oen(out_vec[9:9]),
    .mdc(out_vec[8:8]),
    .led_an(out_vec[7:7]),
    .led_char_err(out_vec[6:6]),
    .led_link(out_vec[5:5]),
    .led_disp_err(out_vec[4:4]),
    .led_crs(out_vec[3:3]),
    .led_col(out_vec[2:2]),
    .txp(out_vec[1:1]),
    .rx_recovclkout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h66fc8942d2175089d755ea;
    stim[1] = 87'h2c860427c8ac179a03332e;
    stim[2] = 87'h6bdc955faf428a709a7421;
    stim[3] = 87'h26be5ff805304433d2e2f7;
    stim[4] = 87'h7544583c4fa9f6fba96cf7;
    stim[5] = 87'h2c70f146c90cbe32311ea1;
    stim[6] = 87'h2805321f1849e4cf58c877;
    stim[7] = 87'h184d67d886dbd2d5f43431;
    stim[8] = 87'h4575427f4fd082c7218553;
    stim[9] = 87'h3f4dd5dcc90c068e3344b7;
    stim[10] = 87'h6047556edf40740dff1b40;
    stim[11] = 87'h243d51f4ac507ccc26beb3;
    stim[12] = 87'h50c82d20de23c1b1c9d697;
    stim[13] = 87'h70b4c06a2717dbe68fa863;
    stim[14] = 87'h0f8975b8342fd728b003e6;
    stim[15] = 87'h5b2824d0631c5ee60e08a1;
    stim[16] = 87'h7911b06d52515dc74ea3d3;
    stim[17] = 87'h1e2988f68c77dea1c17ba3;
    stim[18] = 87'h2924b21f99f644d17c55c7;
    stim[19] = 87'h5b66b736770269c5b4de11;
    stim[20] = 87'h3482d35def52661bb38533;
    stim[21] = 87'h5e8a861a8a46cb86f324b5;
    stim[22] = 87'h26880f196f323f3677a7e3;
    stim[23] = 87'h6141cff78ab426b9525c21;
    stim[24] = 87'h0c33ed7f6dca1944487902;
    stim[25] = 87'h17693fe050c849ba712317;
    stim[26] = 87'h410ef144735b5dc7dda211;
    stim[27] = 87'h79ffe222c39ebe3a390201;
    stim[28] = 87'h27532eaaaf4c2dbb48b700;
    stim[29] = 87'h1f4d5c247420830c9b1646;
    stim[30] = 87'h389782d530fcf6521fd105;
    stim[31] = 87'h271d62acc67fb2f4ae4aec;
    stim[32] = 87'h05b230b6f0a9ab87b51710;
    stim[33] = 87'h73a8f248146f700965ee22;
    stim[34] = 87'h33e1c356642314c50e5ec2;
    stim[35] = 87'h0a4272a821526a322c0c94;
    stim[36] = 87'h4350018a7e012b15a62481;
    stim[37] = 87'h2c92962b7e0fa0a4e55557;
    stim[38] = 87'h162116439e9c2d60f52472;
    stim[39] = 87'h1d3a7a4f3c8eefe0b8a507;
    stim[40] = 87'h40b3f70db072e7e6ce85f7;
    stim[41] = 87'h0fcdc9f7b38a4041526ce5;
    stim[42] = 87'h0a66078fb6c57b8d973220;
    stim[43] = 87'h0e6a101bafee3802b98a91;
    stim[44] = 87'h2dbf66931b11ee5f81fe80;
    stim[45] = 87'h143b3bf6516e4326c16f62;
    stim[46] = 87'h0e5ac61e6780ea33a9c412;
    stim[47] = 87'h5e4478051e4c625f998815;
    stim[48] = 87'h5043e2d713daf894c919e7;
    stim[49] = 87'h4df3e021912c0e91f9adf3;
    stim[50] = 87'h7ee9663ff597ce424a9e76;
    stim[51] = 87'h78daecbd040e255f6c7024;
    stim[52] = 87'h09eb13e02815a9bcb72c87;
    stim[53] = 87'h4713a42dc101d8c2f09d53;
    stim[54] = 87'h3194e2184fa1dee21aa2a1;
    stim[55] = 87'h24d852b3cdc0046b5c4d94;
    stim[56] = 87'h2edbfe8c307895c4cfc044;
    stim[57] = 87'h24a469ea6b2105399a3cb0;
    stim[58] = 87'h741da50c2a33718aabf6e2;
    stim[59] = 87'h79679f47a003c2fc651466;
    stim[60] = 87'h42c95e87715c292efd4b97;
    stim[61] = 87'h687dc024bcf0a8a93e4f82;
    stim[62] = 87'h2226f16ec7cd7a65dbb7c3;
    stim[63] = 87'h1ce52fcc51a38477c358d5;
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
      expv[0] = 88'h0000000000000000000000;
      expv[1] = 88'h0000000000000000000000;
      expv[2] = 88'h0000000000000000000000;
      expv[3] = 88'h0000000000000000000000;
      expv[4] = 88'h0000000000000000000000;
      expv[5] = 88'h0000000000000000000000;
      expv[6] = 88'h0000000000000000000000;
      expv[7] = 88'h0000000000000000000000;
      expv[8] = 88'h0000000000000000000000;
      expv[9] = 88'h0000000000000000000000;
      expv[10] = 88'h0000000000000000000000;
      expv[11] = 88'h0000000000000000000000;
      expv[12] = 88'h0000000000000000000000;
      expv[13] = 88'h0000000000000000000000;
      expv[14] = 88'h0000000000000000000000;
      expv[15] = 88'h0000000000000000000000;
      expv[16] = 88'h0000000000000000000000;
      expv[17] = 88'h0000000000000000000000;
      expv[18] = 88'h0000000000000000000000;
      expv[19] = 88'h0000000000000000000000;
      expv[20] = 88'h0000000000000000000000;
      expv[21] = 88'h0000000000000000000000;
      expv[22] = 88'h0000000000000000000000;
      expv[23] = 88'h0000000000000000000000;
      expv[24] = 88'h0000000000000000000000;
      expv[25] = 88'h0000000000000000000000;
      expv[26] = 88'h0000000000000000000000;
      expv[27] = 88'h0000000000000000000000;
      expv[28] = 88'h0000000000000000000000;
      expv[29] = 88'h0000000000000000000000;
      expv[30] = 88'h0000000000000000000000;
      expv[31] = 88'h0000000000000000000000;
      expv[32] = 88'h0000000000000000000000;
      expv[33] = 88'h0000000000000000000000;
      expv[34] = 88'h0000000000000000000000;
      expv[35] = 88'h0000000000000000000000;
      expv[36] = 88'h0000000000000000000000;
      expv[37] = 88'h0000000000000000000000;
      expv[38] = 88'h0000000000000000000000;
      expv[39] = 88'h0000000000000000000000;
      expv[40] = 88'h0000000000000000000000;
      expv[41] = 88'h0000000000000000000000;
      expv[42] = 88'h0000000000000000000000;
      expv[43] = 88'h0000000000000000000000;
      expv[44] = 88'h0000000000000000000000;
      expv[45] = 88'h0000000000000000000000;
      expv[46] = 88'h0000000000000000000000;
      expv[47] = 88'h0000000000000000000000;
      expv[48] = 88'h0000000000000000000000;
      expv[49] = 88'h0000000000000000000000;
      expv[50] = 88'h0000000000000000000000;
      expv[51] = 88'h0000000000000000000000;
      expv[52] = 88'h0000000000000000000000;
      expv[53] = 88'h0000000000000000000000;
      expv[54] = 88'h0000000000000000000000;
      expv[55] = 88'h0000000000000000000000;
      expv[56] = 88'h0000000000000000000000;
      expv[57] = 88'h0000000000000000000000;
      expv[58] = 88'h0000000000000000000000;
      expv[59] = 88'h0000000000000000000000;
      expv[60] = 88'h0000000000000000000000;
      expv[61] = 88'h0000000000000000000000;
      expv[62] = 88'h0000000000000000000000;
      expv[63] = 88'h0000000000000000000000;
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
