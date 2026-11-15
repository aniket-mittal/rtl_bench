// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 88;
  localparam OW = 82;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_075086 dut (
    .clk(clk),
    .reset(in_vec[87:87]),
    .x(in_vec[86:60]),
    .y(in_vec[59:33]),
    .z(in_vec[32:6]),
    .valid_in(in_vec[5:5]),
    .shift(in_vec[4:0]),
    .x_pipe(out_vec[81:55]),
    .y_pipe(out_vec[54:28]),
    .z_pipe(out_vec[27:1]),
    .valid_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 88'h8529a84bc2e6dc839e2f83;
    stim[1] = 88'he5ac459a5a43d059c9259d;
    stim[2] = 88'h3a8e16ca142dfd0bbf66f9;
    stim[3] = 88'h048a1aee03a94203ab8db8;
    stim[4] = 88'h3cd410b5a2201ebea3f926;
    stim[5] = 88'h1dae578158f10df06211e1;
    stim[6] = 88'h7e70903de10e579e4c457a;
    stim[7] = 88'h3dac12e1d85e8b6fd1ef87;
    stim[8] = 88'h101623de54216394692c89;
    stim[9] = 88'h0d2f299eb89d2222ace71f;
    stim[10] = 88'h67bffa58a035a0736ab355;
    stim[11] = 88'h7a56e6ee9fcb6bb544260d;
    stim[12] = 88'h3fa74205bc17e553b1f3ab;
    stim[13] = 88'h5040f798e82d7b1ec80764;
    stim[14] = 88'h2940d35f5a234ed87a59a4;
    stim[15] = 88'h58d3844e99c4c5edf39757;
    stim[16] = 88'h0f865746afa415ee3d3bc0;
    stim[17] = 88'h146dce61c91b56f44539c2;
    stim[18] = 88'h097f94eb30477ccdc50060;
    stim[19] = 88'h1494f5e67584eb98851e1e;
    stim[20] = 88'h105a571cd4e46343d46926;
    stim[21] = 88'h088cfb44cc045efdc363b3;
    stim[22] = 88'h3ce90bedde56c8765154f9;
    stim[23] = 88'h57ba65f99e3db56ff5f52f;
    stim[24] = 88'h58fbd247aa98a611c247b8;
    stim[25] = 88'h54a8adb2635e0455e6c075;
    stim[26] = 88'h7580937d6282b645cc8f17;
    stim[27] = 88'h42900a2163ca3105395137;
    stim[28] = 88'h3a937b6448d73cae868d70;
    stim[29] = 88'h1624a554c9e1c687d5b4f6;
    stim[30] = 88'h7c59411457edb10ecb9a89;
    stim[31] = 88'h6f595837e660703b4e1140;
    stim[32] = 88'h649aeadf74c79de5f552db;
    stim[33] = 88'h00b4bed506797b9c723537;
    stim[34] = 88'h3ae90139e5244a7dbc6a5e;
    stim[35] = 88'h51fae87faa43f32da9ad40;
    stim[36] = 88'h574370a6df08876191b827;
    stim[37] = 88'h6d31d9c7b5b49321f72a0f;
    stim[38] = 88'h400b934659a0e8bc24feb1;
    stim[39] = 88'h38e4e4b5e92065af3f4aaa;
    stim[40] = 88'h7401f7cec5ddc464f04bd9;
    stim[41] = 88'h3a06277e520c789140978a;
    stim[42] = 88'h191d4cffcae42180262e99;
    stim[43] = 88'h4e0bcf0d6139795367c42f;
    stim[44] = 88'h0f6a262f95227ea9e2cbe1;
    stim[45] = 88'h5c0fe0d4788548add4c6fe;
    stim[46] = 88'h2ea9f2e70bcab70372c7b2;
    stim[47] = 88'h575dfaf6a3d4084a611e5c;
    stim[48] = 88'hf930594bc1b3cb76a31669;
    stim[49] = 88'h694c0f95ec9d48ecc0e1ce;
    stim[50] = 88'h6b6b9c8baae82676231666;
    stim[51] = 88'h39bb1be0c21f810c38e2b9;
    stim[52] = 88'h27b7dc7654550b06812693;
    stim[53] = 88'h5dcda5c33fb43b65a3d402;
    stim[54] = 88'h3e3fc381d563be8cb13ba1;
    stim[55] = 88'h3a1c59a71d7732c61d6287;
    stim[56] = 88'h301b7cea8765160b5d5de9;
    stim[57] = 88'h5a3a69160854e128e6ae81;
    stim[58] = 88'h02266217bc0ac340ed2199;
    stim[59] = 88'h1bc4154d47f2dca381daf4;
    stim[60] = 88'h06b5f0279ba645c8f68462;
    stim[61] = 88'h58c4dc5721ca30cfc7158d;
    stim[62] = 88'h6f35bbbf9bbe118663ef98;
    stim[63] = 88'h6ee12b52724f0c35e7f85d;
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
      expv[0] = 82'h000000000000000000000;
      expv[1] = 82'h000000000000000000000;
      expv[2] = 82'h000000000000000000000;
      expv[3] = 82'h1d470b650a16ff85dfb37;
      expv[4] = 82'h02450d7701d4a101d5c6d;
      expv[5] = 82'h1e6a085ac1db0b5f91fc9;
      expv[6] = 82'h0ed72bc7bf05ca003108f;
      expv[7] = 82'h3f38481ef0872acf2622b;
      expv[8] = 82'h1ed60970e479c3b808f7c;
      expv[9] = 82'h080b11ef2a9162ca2c964;
      expv[10] = 82'h069794cf5c4e911156738;
      expv[11] = 82'h33dffd2c501ac339b5592;
      expv[12] = 82'h3d2b73774fe2e0daa1930;
      expv[13] = 82'h1fd3a102dd8ca4a9daf9d;
      expv[14] = 82'h28207bcc4457b48e6403b;
      expv[15] = 82'h14a069afd6527a6b3d2cd;
      expv[16] = 82'h2c69c2274ce25df6f9cb8;
      expv[17] = 82'h07c32ba25f6c96071e9de;
      expv[18] = 82'h0a36e73092d6727e229ce;
      expv[19] = 82'h04bfca76301d0c56e2803;
      expv[20] = 82'h0a4a7af33ac275cc428f0;
      expv[21] = 82'h082d2b8e6e88c6a1aa349;
      expv[22] = 82'h04467da266021e7ee1b3d;
      expv[23] = 82'h1e7485f6ef2b653b28aa7;
      expv[24] = 82'h2bdd32fccf19d1b7fada9;
      expv[25] = 82'h2c7de923d54c5608e123d;
      expv[26] = 82'h2a5456d931af182af360b;
      expv[27] = 82'h3ac049beb1415922e6476;
      expv[28] = 82'h21480510b1e520829ca8b;
      expv[29] = 82'h1d49bdb22467f5574356b;
      expv[30] = 82'h0b1252aa64f0de43eadab;
      expv[31] = 82'h3e2ca08a2c140e876dcd4;
      expv[32] = 82'h37acac1cfd9ab52da708a;
      expv[33] = 82'h324d756fba63cdf2faa96;
      expv[34] = 82'h005a5f6a833cbdce391ab;
      expv[35] = 82'h1d74809cf292253ede352;
      expv[36] = 82'h28fd743cf4d08086d4d6a;
      expv[37] = 82'h2ba1b853749bd5b0e8dc1;
      expv[38] = 82'h3698ece3dadca390fbb50;
      expv[39] = 82'h2005c9a32cd2745e12875;
      expv[40] = 82'h1c72725af3ac9fd7a3a55;
      expv[41] = 82'h3a00fbe762eee1327825e;
      expv[42] = 82'h1d0313bf29ee54489c4bc;
      expv[43] = 82'h0c8ea67fe57210c013174;
      expv[44] = 82'h2705e786b0967da9b3c21;
      expv[45] = 82'h07b5131045e2704cf165f;
      expv[46] = 82'h2e07f06a3c42a556ea637;
      expv[47] = 82'h1754f97385e4a181b967d;
      expv[48] = 82'h000000000000000000000;
      expv[49] = 82'h000000000000000000000;
      expv[50] = 82'h34a607caf654517660b0e;
      expv[51] = 82'h35b5ce45d04efa3ad18b3;
      expv[52] = 82'h1cdd8df0610fbf861c715;
      expv[53] = 82'h13dbee3b2a2a368340954;
      expv[54] = 82'h2ee6d2e228a386b6d1ea0;
      expv[55] = 82'h1f1fe1c6f8b3c34e589dd;
      expv[56] = 82'h1d0e2cd387780e632eb14;
      expv[57] = 82'h180dbe7545336605a6aef;
      expv[58] = 82'h2d1d348c3257289c73574;
      expv[59] = 82'h0113310bde0561a07690c;
      expv[60] = 82'h0de20aa6a3f98951c0ec7;
      expv[61] = 82'h035af813b2fb62e87b423;
      expv[62] = 82'h2c626e2b90f8b667e40ac;
      expv[63] = 82'h379adddfcddf06c331f7c;
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
