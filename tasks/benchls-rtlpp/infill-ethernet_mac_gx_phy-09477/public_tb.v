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

  rtlpp_09477 dut (
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
    stim[0] = 87'h5a2c09d2faff8231655438;
    stim[1] = 87'h5ac183e08a4da669d5520a;
    stim[2] = 87'h77ef473e0c6dab2ab414b5;
    stim[3] = 87'h183a19e889a32244c5c6c2;
    stim[4] = 87'h3734016a3604a55545d465;
    stim[5] = 87'h39dc87143372b5f04aa5d5;
    stim[6] = 87'h241e17a172e329f6606366;
    stim[7] = 87'h124506e61490034afe527a;
    stim[8] = 87'h6c97728ace2f90947034b4;
    stim[9] = 87'h17896ef8206b478a408f15;
    stim[10] = 87'h4b97e1496993e1a4ffc673;
    stim[11] = 87'h00f1e93522d178350bcc17;
    stim[12] = 87'h073d51f089660e30c25a77;
    stim[13] = 87'h49306275bf458ba06e2073;
    stim[14] = 87'h2ca52d661469df91d8dae2;
    stim[15] = 87'h2f5f7c782e6a79e9f92783;
    stim[16] = 87'h2d7b191c0226b93f15e0e3;
    stim[17] = 87'h5f37c17c4f852ab0ed98b1;
    stim[18] = 87'h1de62cff76afbb05afd094;
    stim[19] = 87'h1f2c674e568d6a3c194606;
    stim[20] = 87'h056af8264d36b47cc832d3;
    stim[21] = 87'h4607b9e75128f93f4866c0;
    stim[22] = 87'h6c0d8c1ab3deb41e0d0897;
    stim[23] = 87'h06449fe7d4db2f64bceb56;
    stim[24] = 87'h35b7cc9ec69a1bcfb91fc2;
    stim[25] = 87'h7cc7888afe8da2e9b5de96;
    stim[26] = 87'h714fed18371b29e0cef992;
    stim[27] = 87'h6f3f3a3fcd92e2f1c00ee6;
    stim[28] = 87'h019dd2fd3ced93106f5da2;
    stim[29] = 87'h009e18e5bc623171513b04;
    stim[30] = 87'h7e01e613a57bece50c7e04;
    stim[31] = 87'h10d83935f8303e8e652c97;
    stim[32] = 87'h38615273fda22ff2ff3257;
    stim[33] = 87'h7bef0f78162bd08351bba0;
    stim[34] = 87'h3077e9ae2fd1819b46f9f1;
    stim[35] = 87'h3ace435a52224eeead2d31;
    stim[36] = 87'h5ef8558577d6c1dae9e3e0;
    stim[37] = 87'h21f02f6b2898a783337bf2;
    stim[38] = 87'h7d7d1627233255bd129941;
    stim[39] = 87'h3cf22ae54be0682887c362;
    stim[40] = 87'h52f33240e13e48c7db6ba0;
    stim[41] = 87'h34ad56450a512682fa47e3;
    stim[42] = 87'h3d317a0f30109dcd3e9245;
    stim[43] = 87'h4fb37ef63bedec9080a798;
    stim[44] = 87'h423f9134cef40e2cdec571;
    stim[45] = 87'h796c9e9dbdfa71a88712c6;
    stim[46] = 87'h6171a4f0f6407e05f35263;
    stim[47] = 87'h2af4062f802a97181f2341;
    stim[48] = 87'h1f10b1ac8e335f65ad8777;
    stim[49] = 87'h2f20b272d9a96b2b0b42f7;
    stim[50] = 87'h0f6581896c83c417fb9291;
    stim[51] = 87'h44552853ecdded16c554d1;
    stim[52] = 87'h69c37b9cb8566381200792;
    stim[53] = 87'h18e5c66908cacdf32b0ed2;
    stim[54] = 87'h260cffc3848102717bc226;
    stim[55] = 87'h5f78b66234e73a3a0aecf0;
    stim[56] = 87'h076c7a7c594634749208c7;
    stim[57] = 87'h2590240cfcdf6b84289f46;
    stim[58] = 87'h7fb6279beeadc3d1b8d121;
    stim[59] = 87'h7d28f42f6b7066afe16117;
    stim[60] = 87'h77d5642d0be0f0d6773ed5;
    stim[61] = 87'h031ab2a468bce91ac7161f;
    stim[62] = 87'h1437c4a05f2606be72c8dc;
    stim[63] = 87'h688c8696215351725f9c53;
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
      expv[0] = 88'h0000000000000000000200;
      expv[1] = 88'h0000000000000000000200;
      expv[2] = 88'h0000000000000000000200;
      expv[3] = 88'h0000000000000000000200;
      expv[4] = 88'h0000000000000000000200;
      expv[5] = 88'h0000000000000000000200;
      expv[6] = 88'h0000000000000000000200;
      expv[7] = 88'h0000000000000000000200;
      expv[8] = 88'h0000000000000000000200;
      expv[9] = 88'h0000000000000000000200;
      expv[10] = 88'h0000000000000000000200;
      expv[11] = 88'h0000000000000000000200;
      expv[12] = 88'h0000000000000000000200;
      expv[13] = 88'h0000000000000000000200;
      expv[14] = 88'h0000000000000000000200;
      expv[15] = 88'h0000000000000000000200;
      expv[16] = 88'h0000000000000000000200;
      expv[17] = 88'h0000000000000000000200;
      expv[18] = 88'h0000000000000000000200;
      expv[19] = 88'h0000000000000000000200;
      expv[20] = 88'h0000000000000000000200;
      expv[21] = 88'h0000000000000000000200;
      expv[22] = 88'h0000000000000000000200;
      expv[23] = 88'h0000000000000000000200;
      expv[24] = 88'h0000000000000000000200;
      expv[25] = 88'h0000000000000000000200;
      expv[26] = 88'h0000000000000000000200;
      expv[27] = 88'h0000000000000000000200;
      expv[28] = 88'h0000000000000000000200;
      expv[29] = 88'h0000000000000000000200;
      expv[30] = 88'h0000000000000000000200;
      expv[31] = 88'h0000000000000000000200;
      expv[32] = 88'h0000000000000000000200;
      expv[33] = 88'h0000000000000000000200;
      expv[34] = 88'h0000000000000000000200;
      expv[35] = 88'h0000000000000000000200;
      expv[36] = 88'h0000000000000000000200;
      expv[37] = 88'h0000000000000000000200;
      expv[38] = 88'h0000000000000000000200;
      expv[39] = 88'h0000000000000000000200;
      expv[40] = 88'h0000000000000000000200;
      expv[41] = 88'h0000000000000000000200;
      expv[42] = 88'h0000000000000000000200;
      expv[43] = 88'h0000000000000000000200;
      expv[44] = 88'h0000000000000000000200;
      expv[45] = 88'h0000000000000000000200;
      expv[46] = 88'h0000000000000000000200;
      expv[47] = 88'h0000000000000000000200;
      expv[48] = 88'h0000000000000000000200;
      expv[49] = 88'h0000000000000000000200;
      expv[50] = 88'h0000000000000000000200;
      expv[51] = 88'h0000000000000000000200;
      expv[52] = 88'h0000000000000000000200;
      expv[53] = 88'h0000000000000000000200;
      expv[54] = 88'h0000000000000000000200;
      expv[55] = 88'h0000000000000000000200;
      expv[56] = 88'h0000000000000000000200;
      expv[57] = 88'h0000000000000000000200;
      expv[58] = 88'h0000000000000000000200;
      expv[59] = 88'h0000000000000000000200;
      expv[60] = 88'h0000000000000000000200;
      expv[61] = 88'h0000000000000000000200;
      expv[62] = 88'h0000000000000000000200;
      expv[63] = 88'h0000000000000000000200;
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
