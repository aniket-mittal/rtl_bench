// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 106;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_030850 dut (
    .clk(clk),
    .rst(in_vec[105:105]),
    .apb_addr(in_vec[104:73]),
    .apb_sel(in_vec[72:72]),
    .apb_enable(in_vec[71:71]),
    .apb_write(in_vec[70:70]),
    .apb_wdata(in_vec[69:38]),
    .apb_strb(in_vec[37:34]),
    .wb_ack_i(in_vec[33:33]),
    .wb_err_i(in_vec[32:32]),
    .wb_dat_i(in_vec[31:0]),
    .apb_ready(out_vec[104:104]),
    .apb_rdata(out_vec[103:72]),
    .apb_slverr(out_vec[71:71]),
    .wb_cyc_o(out_vec[70:70]),
    .wb_stb_o(out_vec[69:69]),
    .wb_we_o(out_vec[68:68]),
    .wb_adr_o(out_vec[67:36]),
    .wb_dat_o(out_vec[35:4]),
    .wb_sel_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 106'h342be796db06e3e1b914859784f;
    stim[1] = 106'h36d2f68f81e73be541102634961;
    stim[2] = 106'h0774edf5fbd86824c781e4962bb;
    stim[3] = 106'h06eac772eb5aa0191eddbaa8866;
    stim[4] = 106'h0d400be4c9437b53e289a1f527b;
    stim[5] = 106'h1459eb394a13e0d4a314386e472;
    stim[6] = 106'h1b613cba27d3930ac3837015e56;
    stim[7] = 106'h08bb3346368801ec404d3f56205;
    stim[8] = 106'h183faaa7b95cc1b9f2587d2d01b;
    stim[9] = 106'h19c3b1c7eced97d46020cde508e;
    stim[10] = 106'h04dcd3efaf6de007adf17f3ee97;
    stim[11] = 106'h0cb486afc8c7abcf36a2f24540d;
    stim[12] = 106'h00919ce28ed13b9d8da047ceff7;
    stim[13] = 106'h0189b695394c2ddde33660495c2;
    stim[14] = 106'h1ad4ad383a57302e42d46603aef;
    stim[15] = 106'h05f4e200f132edc4335bc17a3ae;
    stim[16] = 106'h1f0a25f2fffcc622f388b6371bf;
    stim[17] = 106'h1198d30fcf78d3704dbc044a80c;
    stim[18] = 106'h0cb981b378e7094e364a585da29;
    stim[19] = 106'h19c02ef40eb90b32881b9f38f22;
    stim[20] = 106'h0a195a8c485008aecceef66185b;
    stim[21] = 106'h0c3dc408087dcbff171e7f93481;
    stim[22] = 106'h1c655d421ad09601c510d13f59c;
    stim[23] = 106'h1b461f4918562b5524ecafdaa25;
    stim[24] = 106'h156bcfe5439d16ffffe0cc58588;
    stim[25] = 106'h178b36b229803f7804b1b6c08df;
    stim[26] = 106'h18addb239137dcb8b3a4adf3523;
    stim[27] = 106'h06ed4c27f29108529a3d34d5d9c;
    stim[28] = 106'h1de53603d098054aa76f108721f;
    stim[29] = 106'h063e1cd5248cb6040ed9947c855;
    stim[30] = 106'h1cc19ff62492edd2f52cbacaeaa;
    stim[31] = 106'h14d11ceac1ce622a8cd868c0b39;
    stim[32] = 106'h0379dfef64532b5648313fcff17;
    stim[33] = 106'h1e7b52e4418eb87f04989968883;
    stim[34] = 106'h085b579c2040736914ac5a7c83b;
    stim[35] = 106'h1cbe204a16553edf677bc8cd648;
    stim[36] = 106'h01dd0b860f931320778b41ff071;
    stim[37] = 106'h092397620f5889e51a6519d6582;
    stim[38] = 106'h01927cad20df0d065b763753ec5;
    stim[39] = 106'h14096b9821572e755f337ddd7b5;
    stim[40] = 106'h181e46b7e64e6132dfcf661d299;
    stim[41] = 106'h26795f5030ed47d09999c00b171;
    stim[42] = 106'h167d9f990a09280b56286ebf44b;
    stim[43] = 106'h1f33431f1f0eb097585b031e13e;
    stim[44] = 106'h1dcbe5ec6337b21c9a7e1ec4f5f;
    stim[45] = 106'h19ac304d0eb0bc1a6ccc393dcce;
    stim[46] = 106'h0de161e67c5261800d56725d68f;
    stim[47] = 106'h1e7e45fba44f0c9cc7e63b322bc;
    stim[48] = 106'h0712609800ed87ee840429721dc;
    stim[49] = 106'h1f1115a216a524de4d638eb3a1f;
    stim[50] = 106'h0e549db243b2db0700d2dc99321;
    stim[51] = 106'h103ae532ec302184c5024c07500;
    stim[52] = 106'h09c59de1acd93db3df1beab67c5;
    stim[53] = 106'h00e88df831c4e4503bad3e9ca62;
    stim[54] = 106'h066e09fdaf7dec145214ace94aa;
    stim[55] = 106'h178fdaaf8a0093ba31e88cf9508;
    stim[56] = 106'h067523a5b8416db84cd6f11fe96;
    stim[57] = 106'h1f0f8b0e4e8a56d6bb3ccc3445e;
    stim[58] = 106'h10e5aeca84b06a097ed496cf5a1;
    stim[59] = 106'h02856bdee90567b268d78a22a89;
    stim[60] = 106'h0136d95fd90a4ed280df8eeb693;
    stim[61] = 106'h0377394a201572f186cf479d566;
    stim[62] = 106'h123ee089b5c05fd3f770a424f6f;
    stim[63] = 106'h08e541812c0e673056f7e3f2991;
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
      expv[0] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 105'h000000000xxxxxxxxxxxxxxxxxx;
      expv[2] = 105'h000000000xxxxxxxxxxxxxxxxxx;
      expv[3] = 105'h00000000063ba76faff61a0931f;
      expv[4] = 105'h00000000063ba76faff61a0931f;
      expv[5] = 105'h00000000063ba76faff61a0931f;
      expv[6] = 105'h00000000063ba76faff61a0931f;
      expv[7] = 105'h00000000063ba76faff61a0931f;
      expv[8] = 105'h00000000063ba76faff61a0931f;
      expv[9] = 105'h00000000063ba76faff61a0931f;
      expv[10] = 105'h10cde508e03ba76faff61a0931f;
      expv[11] = 105'h00000000003ba76faff61a0931f;
      expv[12] = 105'h00000000003ba76faff61a0931f;
      expv[13] = 105'h00000000003ba76faff61a0931f;
      expv[14] = 105'h00000000060c4db4a9530b7778f;
      expv[15] = 105'h00000000060c4db4a9530b7778f;
      expv[16] = 105'h00000000060c4db4a9530b7778f;
      expv[17] = 105'h00000000060c4db4a9530b7778f;
      expv[18] = 105'h1c044a80c80c4db4a9530b7778f;
      expv[19] = 105'h00000000000c4db4a9530b7778f;
      expv[20] = 105'h00000000000c4db4a9530b7778f;
      expv[21] = 105'h00000000000c4db4a9530b7778f;
      expv[22] = 105'h00000000000c4db4a9530b7778f;
      expv[23] = 105'h0000000006e32aea10b4258071f;
      expv[24] = 105'h1cafdaa250e32aea10b4258071f;
      expv[25] = 105'h0000000000e32aea10b4258071f;
      expv[26] = 105'h0000000000e32aea10b4258071f;
      expv[27] = 105'h0000000006c56ed91c4df72e2cf;
      expv[28] = 105'h1d34d5d9c8c56ed91c4df72e2cf;
      expv[29] = 105'h0000000000c56ed91c4df72e2cf;
      expv[30] = 105'h0000000000c56ed91c4df72e2cf;
      expv[31] = 105'h0000000000c56ed91c4df72e2cf;
      expv[32] = 105'h0000000000c56ed91c4df72e2cf;
      expv[33] = 105'h0000000000c56ed91c4df72e2cf;
      expv[34] = 105'h0000000000c56ed91c4df72e2cf;
      expv[35] = 105'h0000000000c56ed91c4df72e2cf;
      expv[36] = 105'h0000000007e5f10250954fb7d9d;
      expv[37] = 105'h0000000007e5f10250954fb7d9d;
      expv[38] = 105'h1519d65821e5f10250954fb7d9d;
      expv[39] = 105'h0000000001e5f10250954fb7d9d;
      expv[40] = 105'h0000000001e5f10250954fb7d9d;
      expv[41] = 105'h0000000001e5f10250954fb7d9d;
      expv[42] = 105'h000000000033cafa813b51f426f;
      expv[43] = 105'h000000000033cafa813b51f426f;
      expv[44] = 105'h0000000007f99a18f8c3ac25d61;
      expv[45] = 105'h1e1ec4f5f9f99a18f8c3ac25d61;
      expv[46] = 105'h0000000001f99a18f8c3ac25d61;
      expv[47] = 105'h00000000076f0b0f33149860035;
      expv[48] = 105'h163b322bc16f0b0f33149860035;
      expv[49] = 105'h00000000016f0b0f33149860035;
      expv[50] = 105'h0000000007f888ad10a94937935;
      expv[51] = 105'h0000000007f888ad10a94937935;
      expv[52] = 105'h0000000007f888ad10a94937935;
      expv[53] = 105'h0000000007f888ad10a94937935;
      expv[54] = 105'h1d3e9ca621f888ad10a94937935;
      expv[55] = 105'h0000000001f888ad10a94937935;
      expv[56] = 105'h0000000001f888ad10a94937935;
      expv[57] = 105'h000000000633a91d2d105b6e13f;
      expv[58] = 105'h1ccc3445e833a91d2d105b6e13f;
      expv[59] = 105'h000000000033a91d2d105b6e13f;
      expv[60] = 105'h000000000033a91d2d105b6e13f;
      expv[61] = 105'h000000000609b6cafe4293b4a0f;
      expv[62] = 105'h000000000609b6cafe4293b4a0f;
      expv[63] = 105'h10a424f6f809b6cafe4293b4a0f;
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
