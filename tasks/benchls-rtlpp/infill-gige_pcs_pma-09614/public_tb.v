// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09614 dut (
    .clk(clk),
    .gmii_tx_d(in_vec[43:36]),
    .gmii_tx_en(in_vec[35:35]),
    .gmii_tx_err(in_vec[34:34]),
    .reset_tx_clk(in_vec[33:33]),
    .reset_rx_clk(in_vec[32:32]),
    .address(in_vec[31:27]),
    .read(in_vec[26:26]),
    .writedata(in_vec[25:10]),
    .write(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .rxp(in_vec[7:7]),
    .ref_clk(in_vec[6:6]),
    .reconfig_clk(in_vec[5:5]),
    .reconfig_togxb(in_vec[4:1]),
    .gxb_cal_blk_clk(in_vec[0:0]),
    .gmii_rx_d(out_vec[50:43]),
    .gmii_rx_dv(out_vec[42:42]),
    .gmii_rx_err(out_vec[41:41]),
    .tx_clk(out_vec[40:40]),
    .rx_clk(out_vec[39:39]),
    .readdata(out_vec[38:23]),
    .waitrequest(out_vec[22:22]),
    .txp(out_vec[21:21]),
    .reconfig_fromgxb(out_vec[20:4]),
    .led_an(out_vec[3:3]),
    .led_disp_err(out_vec[2:2]),
    .led_char_err(out_vec[1:1]),
    .led_link(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'habee8dd2d94;
    stim[1] = 44'hbad914317a3;
    stim[2] = 44'hf0e615df035;
    stim[3] = 44'h2ef150ba072;
    stim[4] = 44'hc793a47fed1;
    stim[5] = 44'h32956445ac6;
    stim[6] = 44'hf152bc01aae;
    stim[7] = 44'h23a0696e47f;
    stim[8] = 44'h3e869bf8688;
    stim[9] = 44'h24466b00fcc;
    stim[10] = 44'hacc7a8a62f5;
    stim[11] = 44'hdab571a3e88;
    stim[12] = 44'h318bfb8b2ad;
    stim[13] = 44'h9db2d3faa62;
    stim[14] = 44'h16a7f818290;
    stim[15] = 44'h949bafc9e7f;
    stim[16] = 44'h9cb83a0ac42;
    stim[17] = 44'h1ba0161aeb4;
    stim[18] = 44'hc3747ba4471;
    stim[19] = 44'h01185c9d678;
    stim[20] = 44'hd8602fd5837;
    stim[21] = 44'h922e6b04a59;
    stim[22] = 44'h638d6dcf0ac;
    stim[23] = 44'h23546e56ade;
    stim[24] = 44'hbdb4ffedc27;
    stim[25] = 44'hdf5b21598ca;
    stim[26] = 44'he41eb86ccd9;
    stim[27] = 44'h2c56d4c4639;
    stim[28] = 44'ha7ffa000a8e;
    stim[29] = 44'h3431d47f292;
    stim[30] = 44'h4e6cde57ca9;
    stim[31] = 44'h8ccfc58483d;
    stim[32] = 44'h659c297e0e0;
    stim[33] = 44'h3970dcd983e;
    stim[34] = 44'h3a589ac0257;
    stim[35] = 44'hae339a6789d;
    stim[36] = 44'hc9b29894e0e;
    stim[37] = 44'h4272ffff0d6;
    stim[38] = 44'h94bdf3858c3;
    stim[39] = 44'hdd7c7ac84a7;
    stim[40] = 44'hd72303f4c11;
    stim[41] = 44'hac95b583ac2;
    stim[42] = 44'h563557f2a04;
    stim[43] = 44'h0d2c27cecb1;
    stim[44] = 44'hd5f3798bc36;
    stim[45] = 44'h472fc452655;
    stim[46] = 44'h73d14aefa9e;
    stim[47] = 44'h8db0aec1877;
    stim[48] = 44'hc94de6c26da;
    stim[49] = 44'he8f60482426;
    stim[50] = 44'h5dba082529c;
    stim[51] = 44'hb9b4e2252ca;
    stim[52] = 44'h990852a5cff;
    stim[53] = 44'h82e31b27c71;
    stim[54] = 44'hb64c02b46b1;
    stim[55] = 44'h08c0156daef;
    stim[56] = 44'h615761a1638;
    stim[57] = 44'h9236e54c4e0;
    stim[58] = 44'hc496404b4ef;
    stim[59] = 44'h47b2337f0a0;
    stim[60] = 44'h54af058f4f5;
    stim[61] = 44'hc279d71e285;
    stim[62] = 44'ha55a900c087;
    stim[63] = 44'had9537a7098;
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
      expv[0] = 51'h0000000000000;
      expv[1] = 51'h0000000000000;
      expv[2] = 51'h0000000000000;
      expv[3] = 51'h786abbe0aaaa9;
      expv[4] = 51'h1762174099999;
      expv[5] = 51'h63d48ffa88889;
      expv[6] = 51'h195488b233339;
      expv[7] = 51'h78b7803277779;
      expv[8] = 51'h11cd2dc8ffff9;
      expv[9] = 51'h0000000000000;
      expv[10] = 51'h0000000000000;
      expv[11] = 51'h567d14c2aaaa9;
      expv[12] = 51'h6d46347a44449;
      expv[13] = 51'h18df716266669;
      expv[14] = 51'h4ec27f5011119;
      expv[15] = 51'h0b4f030288889;
      expv[16] = 51'h4a55f938ffff9;
      expv[17] = 51'h4e47415811119;
      expv[18] = 51'h0dcac35aaaaa9;
      expv[19] = 51'h61a7748888889;
      expv[20] = 51'h009393a8cccc9;
      expv[21] = 51'h6c2dfab0bbbb9;
      expv[22] = 51'h490d6090cccc9;
      expv[23] = 51'h31ddb9e266669;
      expv[24] = 51'h11b5cad2ffff9;
      expv[25] = 51'h5ec7fdb833339;
      expv[26] = 51'h6fb42b3255559;
      expv[27] = 51'h72170d9acccc9;
      expv[28] = 51'h16329888cccc9;
      expv[29] = 51'h53e4001277779;
      expv[30] = 51'h1a028fe299999;
      expv[31] = 51'h272bcafa44449;
      expv[32] = 51'h4678b090eeee9;
      expv[33] = 51'h32d52fc200009;
      expv[34] = 51'h1ca39b30ffff9;
      expv[35] = 51'h1d335800bbbb9;
      expv[36] = 51'h57034cf2eeee9;
      expv[37] = 51'h64c3129877779;
      expv[38] = 51'h2127ffe2bbbb9;
      expv[39] = 51'h4a4670b211119;
      expv[40] = 51'h6ea7590a33339;
      expv[41] = 51'h6b887e9888889;
      expv[42] = 51'h5656b07211119;
      expv[43] = 51'h2b02fe5022229;
      expv[44] = 51'h068cf9da88889;
      expv[45] = 51'h6ae73178bbbb9;
      expv[46] = 51'h23888a48aaaa9;
      expv[47] = 51'h39f15df2ffff9;
      expv[48] = 51'h46c5d830bbbb9;
      expv[49] = 51'h64bcd84adddd9;
      expv[50] = 51'h7460904833339;
      expv[51] = 51'h2ec104a2eeee9;
      expv[52] = 51'h5cc444a255559;
      expv[53] = 51'h4c9a54baffff9;
      expv[54] = 51'h416b64f888889;
      expv[55] = 51'h5b38568a88889;
      expv[56] = 51'h047aadb277779;
      expv[57] = 51'h30b43428cccc9;
      expv[58] = 51'h4904a98a00009;
      expv[59] = 51'h6250096a77779;
      expv[60] = 51'h23c66fe200009;
      expv[61] = 51'h2a48b1eaaaaa9;
      expv[62] = 51'h6122e3c222229;
      expv[63] = 51'h52b2018233339;
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
