/*^* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *  @software    :    berel           <https://git.pluie.org/pluie/berel>
 *  @version     :    0.24
 *  @type        :    program
 *  @date        :    2018
 *  @license     :    GPLv3.0         <http://www.gnu.org/licenses/>
 *  @author      :    a-Sansara       <[dev]at[pluie]dot[org]>
 *  @copyright   :    pluie.org       <http://www.pluie.org>
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *  This file is part of berel.
 *
 *  berel is free software (free as in speech) : you can redistribute it
 *  and/or modify it under the terms of the GNU General Public License as
 *  published by the Free Software Foundation, either version 3 of the License,
 *  or (at your option) any later version.
 *
 *  berel is distributed in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 *  more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with berel.  If not, see <http://www.gnu.org/licenses/>.
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *^*/

using GLib;
using Pluie;

public class Pluie.Berel.Key : Yaml.Object
{
    public string   name      { get; internal set; }
    public string?  address   { get; internal set; }

    public Key.with_node (Yaml.Node node)
    {
        this.yaml_name = node.name;
        if (node.ntype.is_single_pair ()) {
            var s = node.first ().data.split (";");
            this.name = s[0];
            if (s.length > 1) this.address = s[1];
        }
    }
}
