// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01774 dut (
    .clk(clk),
    .a(in_vec[127:96]),
    .b(in_vec[95:64]),
    .c(in_vec[63:32]),
    .d(in_vec[31:0]),
    .a_prim(out_vec[127:96]),
    .b_prim(out_vec[95:64]),
    .c_prim(out_vec[63:32]),
    .d_prim(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'h8e1d031697c039dd65f5b9df12ac79bd;
    stim[1] = 128'h6ef34d44d66c7b351a5585a399e993b2;
    stim[2] = 128'h130f31e775ee9b600ba20ce2c588c44d;
    stim[3] = 128'hba2a26a5fa6c7fdddf76d8076a7261cd;
    stim[4] = 128'h0a9415c0bbefaef225eac7cd3cdd1682;
    stim[5] = 128'he79251e0a4ee4bf78cd72acf283b9e4e;
    stim[6] = 128'haaf7af6a492793c92700f22ea81092d7;
    stim[7] = 128'h7a741b06feda1b1f156121e3d100f1ba;
    stim[8] = 128'h7f4cf41a5e2a3d6bf6d028ce8f3e3d14;
    stim[9] = 128'h9188d26b333dfb49ad106debb689a2b9;
    stim[10] = 128'h2a68e0ec675d311cee9223c2ede671cf;
    stim[11] = 128'h14871af796ad504c59bcaeb730f247bc;
    stim[12] = 128'hd4392608b3cbc7d1bb42843c8bb2383f;
    stim[13] = 128'h3e88eea6c6738078b3e9a1260d58e4c8;
    stim[14] = 128'h2ad24f9ac1d56ce46d05fb3f93e60065;
    stim[15] = 128'h652aeab3c5bd676ce47d27344ecd8b32;
    stim[16] = 128'he880fb7880a4cada11e4b337079a9b93;
    stim[17] = 128'hf717042fb2d05be3ad97f4ea8f17b7a3;
    stim[18] = 128'h662c95377c5dcc520a60ea1dd893f6f0;
    stim[19] = 128'h88e3ada6e938bbaf03f6ad20f359a09c;
    stim[20] = 128'hdb138a4a8dae720ffaa12b8cf5bc0cba;
    stim[21] = 128'heed265cef533b847e2f5f62e2276cf68;
    stim[22] = 128'h2661384de99681fbb69bee34d320b8db;
    stim[23] = 128'h09f6d86991e2c28b715dd5e35ff2f7c8;
    stim[24] = 128'ha34b5bf0eaa855ed7c300cdee97ee0e0;
    stim[25] = 128'h80120ed9c105456eb71b54c7189f9b42;
    stim[26] = 128'hfd0f13112e3ab6fb438c3db3762ecb02;
    stim[27] = 128'h155162eade40ea278edf59e0c294d6a8;
    stim[28] = 128'he8dd74d61a4d638a8d4ff7497d2f3057;
    stim[29] = 128'h98cdf2f94848a01a6dc11fb079b7f029;
    stim[30] = 128'h2b9ab14eb733bd144ed49020c1d0a679;
    stim[31] = 128'hce18db50422a903b363ed7491e261f8c;
    stim[32] = 128'ha0cbe7a2e346c87a3a54dd18643f1c85;
    stim[33] = 128'h9de4d3bf73c3739568a6023954b3b7ac;
    stim[34] = 128'h86f6f1ca3b27dc006693d7153ee185fd;
    stim[35] = 128'h3201960e4a3c4e6e3d0e72bfdec95b98;
    stim[36] = 128'hdedd8b00c233210205501bd554831d97;
    stim[37] = 128'h8182703d3c9ff7f0f25113145954f058;
    stim[38] = 128'h9c62255779e8a1cc41319a5817238395;
    stim[39] = 128'hb11431c866fa6d79e7c68a2cb60fe7f8;
    stim[40] = 128'h01b3ec7ec40b95094f21ef65cf6f922e;
    stim[41] = 128'hde7378ac9ba6ad11241306097fbc3052;
    stim[42] = 128'hdaa8e4e310beea8f83effc13618da1e4;
    stim[43] = 128'h98427529d20483833d219bd04bac5659;
    stim[44] = 128'h34252a9838b8875b484d96518fd985e1;
    stim[45] = 128'h9c58d510b6ba5b626ad8139d86118c98;
    stim[46] = 128'h32dbffed72824c4fc2953f2a78ae9cc1;
    stim[47] = 128'hf15fe04ad3faddbb8021b8feebac1649;
    stim[48] = 128'h2dc14abe22b7a42a95443a31878d25fc;
    stim[49] = 128'hb8bb4865cb82c4ae6b1b2fee62f4597a;
    stim[50] = 128'hfa834b1ee1dd751bed757de16626d438;
    stim[51] = 128'ha2225f8e9ac1f9d36bf2cadf5acbd69d;
    stim[52] = 128'h2c705827c0fc2833f02a32fb8652b795;
    stim[53] = 128'h8dfd760b16219422cc51e61001e78b9f;
    stim[54] = 128'h855ac4f8e4f05b6fdb3850ce0d376231;
    stim[55] = 128'hd957f48dc4fbd45d7e340538f570a5b0;
    stim[56] = 128'h78778202a7147463b8262c2cfec31983;
    stim[57] = 128'h7a37562f4473a8ce4ad0e63b0ce20948;
    stim[58] = 128'h74f6bb7e50d70e7bb160ef75848eca4e;
    stim[59] = 128'h5383ba755ce2a4d9a276642b7cff8fc9;
    stim[60] = 128'hde120658ac224eeffaa92b77c4407853;
    stim[61] = 128'he42f1753988cc50cb5e6e860fffbef1d;
    stim[62] = 128'h73f1d6084be0aa0743dd3431c9ec96fa;
    stim[63] = 128'hb245e5538e7cdcc149ede8bdc978ca46;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 128'he30b44402d89e99b997d5d0881a6cf4f;
      expv[4] = 128'h38241c22e833b028b096241e24946988;
      expv[5] = 128'h95dcea00277ffbd2f5f008e72004b8cf;
      expv[6] = 128'h1842bbc26bc0b8892a736b9e429f5217;
      expv[7] = 128'hc52588c63a765c29e2aef035acadd977;
      expv[8] = 128'ha4f95fc09ab716cb9093f7b1c8a9b0af;
      expv[9] = 128'h80f4cfc17096a11acaa65e51c8a43f13;
      expv[10] = 128'hdbbea498aae0108d05da9250c58db867;
      expv[11] = 128'he3562025225ea1468d8e5e98e28111b6;
      expv[12] = 128'h9390f5e2628ab01a9c46b4abecd564c0;
      expv[13] = 128'h53b80d0e06adc835b846f71ca988525a;
      expv[14] = 128'h5a509a6557613286e808a5b72b0d7f35;
      expv[15] = 128'he9a2d6f0d2be5202caf62d37ee749ade;
      expv[16] = 128'hbbfb0e116cb2532192ed2d1077236372;
      expv[17] = 128'hfb1c9bd5ad3754e1c8eec833ed7de78a;
      expv[18] = 128'h74da6cec69cae18b57a773fe381d98e2;
      expv[19] = 128'heb5c464f4c899e2aea9af7bb49579c2a;
      expv[20] = 128'ha08e46100155993d26cd6fb861c1b0c5;
      expv[21] = 128'hceec2ddfa752b9863df81c29dd6768fd;
      expv[22] = 128'h9978b5b35c1cefe8cca9d624b682953f;
      expv[23] = 128'h00180e10da9337bdf5c83aa7985e154d;
      expv[24] = 128'h9e74d71041c445bc1f83ddcc60a5b7e4;
      expv[25] = 128'h02d9f03b83b2ec973ca9d6ad46655728;
      expv[26] = 128'ha1a2655160ef44e6c90d5271e752683e;
      expv[27] = 128'h46e3e13f1b72479829da57464708e25a;
      expv[28] = 128'h45367dd53a6874c71c77abf570f36838;
      expv[29] = 128'h8595c82d94794f02e74936b3dcb2b0ad;
      expv[30] = 128'he58c9c8d59ba07777cc6e61de6bc4bd0;
      expv[31] = 128'h738c25268ad144d2e7187ee862d9ce02;
      expv[32] = 128'h24dc4ac3d41399657a6c9384d23ebf53;
      expv[33] = 128'hc20820413a1739b46a543259b8f0e0c5;
      expv[34] = 128'h8632cc466a23548e0c39e21e9be30f44;
      expv[35] = 128'h2295ec0bd7729172f12de312c7f0dcb4;
      expv[36] = 128'hd6a1d3fa594968121e5bd3c54afb442f;
      expv[37] = 128'hb72725911793221b7d191a7e7dddd5eb;
      expv[38] = 128'hec46e83c220595834ced485ffe413d07;
      expv[39] = 128'h08cbaba10a11901f3cf62781100be428;
      expv[40] = 128'h192ccbc424a1a7e84bbecf85431ca514;
      expv[41] = 128'hb4062c0b4d595c233027cecbd3960805;
      expv[42] = 128'h3c7cfdfab388c8ccfbcf2dc425e66db8;
      expv[43] = 128'hdcc26212a4b6a595f20bf0efe9c2d945;
      expv[44] = 128'hc4aa6d1634e45df3bdd5c654e78889b9;
      expv[45] = 128'hc603079b40fa6c9e2e88d3eb68ed57fb;
      expv[46] = 128'h7ee6d9258a7d4bf2fe36973b55f298d2;
      expv[47] = 128'h6e359e1eb64e684db019571b40d0ec34;
      expv[48] = 128'hd0d41807e63bdc8607f1d83b2d5ad04b;
      expv[49] = 128'hcf986d87037395e03b9c88800a5f0b78;
      expv[50] = 128'h4c135e930ff91c2d5b69ee0f38bc8b95;
      expv[51] = 128'h85b4294a99f2256ed751418c10afe193;
      expv[52] = 128'he6c365fff6875a06ba769a9237df4908;
      expv[53] = 128'hf47fed87436311b7991ffab0ba010cff;
      expv[54] = 128'he505bcedd96df344f12d98281915c58d;
      expv[55] = 128'h1cbe4dfbfe817aafad27ba8f69d2c099;
      expv[56] = 128'h5d25d8e1e28fe75650c415ff4cb8718c;
      expv[57] = 128'h9b54d31b8469ffe0034fff2079c07264;
      expv[58] = 128'he1d32344b555f582aa175a79601960d5;
      expv[59] = 128'h6e28f08f44f6b74bfe5de6c11849bd28;
      expv[60] = 128'h2ea1d5a839c79778a548ab66bca18e09;
      expv[61] = 128'h05a183960af1645c1dbcf95cfbf659bf;
      expv[62] = 128'h2fdd70db2234977be906ea9478c58c65;
      expv[63] = 128'h9bfe60196686ab5345999d59b716b3d1;
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
